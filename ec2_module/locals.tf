locals {
  common_name_suffix= "${var.project_name}-${var.environment}"
  base_tags = {
    # Assuming you have other standard tags defined somewhere
    Name = var.instance_name
  }
}