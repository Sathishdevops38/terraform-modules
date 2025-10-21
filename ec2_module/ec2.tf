resource "aws_instance" "this"{
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [var.security_groups]
    tags= var.tags
}