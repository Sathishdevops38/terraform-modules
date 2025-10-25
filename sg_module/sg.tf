resource "aws_security_group" "robo-sg"{
  name        = var.sg_name
  description = var.description
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }  
  tags = merge(
    var.sg_tags,
    local.common_tags,{
        Name = "${local.common_suffix}"-"${var.sg_name}"
    }
  )
}