variable "cidr" {
  type = string
}

variable "vpc_tags" {
  type = map
  default = {}
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "igw_tags" {
  type = map
  default = {}
}

variable "public_subnet_cidrs" {
  type = list
}

variable "public_sub_tags" {
  type = map
  default = {}
}

variable "private_subnet_cidrs" {
  type = list
}

variable "private_sub_tags" {
  type = map
  default = {}
}

variable "database_subnet_cidrs" {
  type = list
}

variable "database_sub_tags" {
  type = map
  default = {}
}

variable "public_rt_tags" {
  type = map
  default = {}
}

variable "private_rt_tags" {
  type = map
  default = {}
}

variable "database_rt_tags" {
  type = map
  default = {}
}

variable "eip_tags" {
  type = map
  default = {}
}

variable "nat_gateway_tags" {
  type = map
  default = {}
}

variable "ami_id" {
  type = string
  default = "ami-00fff6c7b7a58866c"
}

variable "instance_type" {
  type = string
  validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Please select either t3 micro or small or medium"
  }
}

variable "sg_ids" {
  type = list
}

variable "tags" {
  type = map
}
