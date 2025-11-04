resource "aws_instance" "component" {
    ami = local.ami_id
    instance_type = var.instance_type # Dynamic instance type
    vpc_security_group_ids = [local.component_sg_id]
    subnet_id = local.private_subnet_id

    tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-${var.component_name}" 
        }
    )
}

resource "terraform_data" "component_provisioning" {
  triggers_replace = [
    aws_instance.component.id
  ]
  
  connection {
    type     = "ssh"
    user     = local.user 
    password = local.password
    host     = aws_instance.component.private_ip
  }

  provisioner "file" {
    source      = "app.sh" # Assumes the script name is consistent or passed as a variable
    destination = "/tmp/app.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/app.sh",
        # Pass the dynamic component name to the script
        "sudo sh /tmp/app.sh ${var.component_name} ${var.environment}"
    ]
  }
}

resource "aws_ec2_instance_state" "component_stop" {
  instance_id = aws_instance.component.id
  state       = "stopped"
  depends_on  = [ terraform_data.component_provisioning ]
}

resource "aws_ami_from_instance" "component_ami" {
  name               = "${var.project_name}-${var.environment}-${var.component_name}-ami"
  source_instance_id = aws_instance.component.id
  depends_on         = [ aws_ec2_instance_state.component_stop ]
  
  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${self.source_instance_id} --region ${var.aws_region}"
    when    = create
  }
  
  tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-${var.component_name}-ami"
        }
  )
}

# -----------------------------------------------------------------------------
# 2. Auto Scaling Group and Load Balancing Resources
# -----------------------------------------------------------------------------

resource "aws_lb_target_group" "component" {
  name        = "${var.project_name}-${var.environment}-${var.component_name}-tg"
  port        = var.application_port # Dynamic port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = local.vpc_id
  
  health_check {
    healthy_threshold = 2
    interval          = 10
    matcher           = "200-299"
    path              = var.health_check_path # Dynamic path
    port              = var.application_port
    protocol          = "HTTP"
    timeout           = 2
    unhealthy_threshold = 2
  }
}

resource "aws_launch_template" "component" {
  name     = "${var.project_name}-${var.environment}-${var.component_name}"
  image_id = aws_ami_from_instance.component_ami.id
  instance_type = var.instance_type

  vpc_security_group_ids = [local.component_sg_id]

  tag_specifications {
    resource_type = "instance"
    tags = merge(local.common_tags, { Name = "${var.project_name}-${var.environment}-${var.component_name}" })
  }
  tag_specifications {
    resource_type = "volume"
    tags = merge(local.common_tags, { Name = "${var.project_name}-${var.environment}-${var.component_name}" })
  }
  tags = merge(local.common_tags, { Name = "${var.project_name}-${var.environment}-${var.component_name}" })
}

resource "aws_autoscaling_group" "component" {
  name                      = "${var.project_name}-${var.environment}-${var.component_name}"
  max_size                  = 10
  min_size                  = 1
  desired_capacity          = 1
  health_check_type         = "ELB"
  vpc_zone_identifier       = local.private_subnet_ids
  target_group_arns         = [aws_lb_target_group.component.arn]
  
  launch_template {
    id      = aws_launch_template.component.id
    version = aws_launch_template.component.latest_version
  }
  
  dynamic "tag" {
    for_each = merge(local.common_tags, { Name = "${var.project_name}-${var.environment}-${var.component_name}" })
    content {
      key               = tag.key
      value             = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_policy" "scaling_policy" {
  autoscaling_group_name = aws_autoscaling_group.component.name
  name                   = "${var.project_name}-${var.environment}-${var.component_name}-scaling-policy"
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

resource "aws_lb_listener_rule" "component_rule" {
  listener_arn = local.backend_alb_listener_arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.component.arn
  }

  condition {
    host_header {
      # Dynamic component name in the host header rule
      values = ["${var.component_name}.backend-alb-${var.environment}.${var.domain_name}"]
    }
  }
}