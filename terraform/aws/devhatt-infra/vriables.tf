variable "region" { default = "sa-east-1" }
variable "project_name" {}
variable "vpc_instance_tenancy" { default = "default" }
variable "vpc_cidr_block" {}
variable "public_subnet_cidr_block" {}


variable "ami_id" { default = "ami-0e4d230445076ef91" }
variable "key_pair_name" {}
variable "instance_type" { default = "t3.medium" }
variable "instance_name" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}