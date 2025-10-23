resource "aws_instance" "this"{
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    subnet_id = aws_subnet.public
    tags= var.tags
}