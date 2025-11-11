# Module data.tf

data "aws_ami" "ami_2023" {
  most_recent = true
  owners      = ["self"] 

  filter {
    name   = "name"
    values = ["devops-practice-ami"] 
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] 
  }
}

data "aws_ssm_parameter" "sg_id" {
  name = "/${var.project_name}/${var.environment}/${var.component}_sg_id"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "backend_alb_listener_arn" {
  name = "/${var.project_name}/${var.environment}/backend_alb_listener_arn"
}

data "aws_ssm_parameter" "frontend_alb_listener_arn" {
  name = "/${var.project_name}/${var.environment}/frontend_alb_listener_arn"
}