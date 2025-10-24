resource "aws_instance" "this"{
    count = var.num_instance
    ami = try(data.aws_ami.ami.id, var.ami_id)
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    tags= merge(
        local.base_tags,{
            "Name" = "${local.common_name_suffix}-${count.index}"
        }
        
    )
}