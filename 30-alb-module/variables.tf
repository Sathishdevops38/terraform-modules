variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_lb" {
  type = string
}

variable "security_groups" {
  type = list
}

variable "subnets" {
  type = list
}

variable "enable_deletion_protection" {
  default = true
}

variable "alb_tags" {
  type = map
}

variable "load_balancer_type" {
  type = string
}

variable "internal" {
  default = false
}