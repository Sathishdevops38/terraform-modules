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
}

variable "sg_tags" {
  type = map 
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}