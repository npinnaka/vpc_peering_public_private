locals {
  tags = {
    environment = "dev"
    app_name    = "VPC"
  }
}

variable "primary_region" {
  description = "AWS region for provider"
  default     = "us-east-1"
}

variable "secondary_region" {
  description = "AWS region for provider"
  default     = "us-west-2"
}

variable "key_name" {
  description = "key name for ec2 kp"
  default = "narenkp"
}