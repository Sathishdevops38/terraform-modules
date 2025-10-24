resource "aws_instance" "this"{
    count = length(var.num_instance)
    ami = try(data.aws_ami.ami.id, var.ami_id)
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    tags= merge(
        local.common_name_suffix,
        var.tags
    )
}