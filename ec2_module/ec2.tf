resource "aws_instance" "this" {
    ami = try(data.aws_ami.ami_2023.id, var.ami_id)
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    tags = var.tags
}