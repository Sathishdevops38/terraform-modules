# Module locals.tf

locals {
    ami_id = data.aws_ami.ami_2023.id
    user = data.aws_ssm_parameter.user.value
    password = data.aws_ssm_parameter.password.value
    private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
    private_subnet_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)
    
    # Use the generic component SG ID data source
    component_sg_id = data.aws_ssm_parameter.component_sg_id.value
    
    backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    
    common_tags = {
        common_name_suffix = "${var.project_name}-${var.environment}"
    }
} 