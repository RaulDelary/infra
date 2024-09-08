output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_instance_tenancy" {
  value = var.vpc_instance_tenancy
}

output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

output "public_subnet_cidr_block" {
  value = var.public_subnet_cidr_block
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
  depends_on = [ aws_subnet.public_subnet ]
}

output "security_group_id" {
  value = aws_security_group.security_group.id
  depends_on = [ aws_security_group.security_group ]
}