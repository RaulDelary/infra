terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "network" {
  source = "../modules/network"
  region = var.region
  project_name = var.project_name
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
}

module "ec2" {
  source = "../modules/ec2"
  ami_id = var.ami_id
  instance_name = var.instance_name
  key_pair_name = var.key_pair_name
  subnet_id = module.network.subnet_id
  security_group_id = module.network.security_group_id
}