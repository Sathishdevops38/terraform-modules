resource "aws_instance" "this" {
    ami = try(data.aws_ami.ami_2023.id, var.ami_id)
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    subnet_id = var.subnet_id
    user_data = var.user_data
    iam_instance_profile = var.iam_profile_name
    root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }
    tags = var.tags
}