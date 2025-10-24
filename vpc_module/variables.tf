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

variable "is_peering_required" {
  type = bool
  default = true
}

