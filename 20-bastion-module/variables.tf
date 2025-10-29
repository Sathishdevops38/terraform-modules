variable "project_name" {
  type = string
}

variable "environment" {
  type = string
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
  type = map(string)
  default = {}
}

variable "subnet_id" {
  type = string
}

# variable "user_data" {
  
# }

