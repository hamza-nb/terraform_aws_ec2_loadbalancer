# variable "is_new" {
#   description = "Decide if we will create the resource or not."
#   type        = number
#   default     = 0
# }

variable "app_name" {
  description = "App Name"
  type        = string
  default = ""
}

variable "region" {
  description = "region code"
  type        = string
  default = ""
}

variable "aws_access_key_id" {
type = string
description = "The AWS access key."
default = ""
}

variable "domain_name" {
  type = string
  default = ""  
}

variable "app_port" {
type = number
description = "app port"
default = 5555
}


variable "ec2_target_id" {
type = string
description = "ec2 target id"
default = ""
}


variable "aws_secret_access_key" {
type = string
description = "The AWS secret access key."
default = ""
}


# terraform init && terraform plan && terraform apply
