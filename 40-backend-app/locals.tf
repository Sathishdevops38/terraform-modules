# Module locals.tf

locals {
    ami_id = data.aws_ami.ami_2023.id
    user = data.aws_ssm_parameter.user.value
    password = data.aws_ssm_parameter.password.value
    private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
    private_subnet_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)
    component_sg_id = data.aws_ssm_parameter.component_sg_id.value
    tg_port = "${var.component_name}" == "frontend" ? 80 : 8080
    health_check_path = "${var.component_name}" == "frontend" ? "/" : "/health"
    backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
    frontend_alb_listener_arn = data.aws_ssm_parameter.frontend_alb_listener_arn.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    listener_arn = "${var.component_name}" == "frontend" ? local.frontend_alb_listener_arn : local.backend_alb_listener_arn
    host_context ="${var.component_name}" == "frontend" ? "${var.project_name}-${var.environment}.${var.domain_name}" : "${var.component_name}.backend-alb-${var.environment}.${var.domain_name}"
    
    common_tags = {
        common_name_suffix = "${var.project_name}-${var.environment}"
    }
} 