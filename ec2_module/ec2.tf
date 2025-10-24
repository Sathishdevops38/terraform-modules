resource "aws_instance" "this" {
    count = var.num_instance
    ami = try(data.aws_ami.ami_2023.id, var.ami_id)
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    
    tags = merge(
        var.tags,
        {
            "Name" = "${var.project_name}-${var.environment}-${count.index + 1}"
        }
    )
}