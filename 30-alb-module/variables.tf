variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "security_groups" {
}

variable "subnets" {
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