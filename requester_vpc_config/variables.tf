locals {
  tags = {
    environment = "dev"
    app_name    = "VPC"
  }
  region     = data.aws_region.region.name
  account_id = data.aws_caller_identity.whoami.account_id
}

variable "az" {
  description = "Availability zone for subnet(a,b,c,d,e,f)"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
}

variable "all_traffic" {
  description = "all traffic to public"
  default     = "0.0.0.0/0"
}

variable "ami" {
  description = "AMI ID for ec2 instance, this value changes for each region"
  default     = "ami-0ed9277fb7eb570c9"
}

variable "key_pair" {
  description = "Keypair for Ec2"
}

variable "vpc_peering_connection_id" {
  description = "VPC Peering connection ID"
}
