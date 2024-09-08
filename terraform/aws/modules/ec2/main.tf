resource "aws_instance" "ec2" {
  ami = var.ami_id

  instance_market_options {
    market_type = "spot"
  }

  key_name = var.key_pair_name
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  instance_type = var.instance_type
  vpc_security_group_ids = [ var.security_group_id ]

  tags = {
    Name = var.instance_name
  }
}