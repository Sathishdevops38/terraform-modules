locals {
  common_tags={
    project_name = var.project_name
    environment =  var.environment
    created_by = "terraform"
  }
  common_suffix = "${var.project_name}-${var.environment}"
  }