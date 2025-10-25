locals {
  common_tags={
    Project = var.project_name
    Terraform =  true
    Environment = var.environment
  }
  common_name_suffix = "${var.project_name}-${var.environment}"
}