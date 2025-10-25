variable "sg_name" {
  type = string
  default = {}
}

variable "description"{
  type = string
  default = "This is the roboshop security group"
}

variable "vpc_id" {
  type = string
  default = {}
}

variable "sg_tags" {
  type = map 
  default = {}
}

variable "project_name" {
  type = string
  default = {}
}

variable "environment" {
  type = string
  default = {}
}