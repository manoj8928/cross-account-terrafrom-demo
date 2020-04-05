# =============================================================================
# EC2 server
resource "aws_instance" "bar1" {
  ami                    = local.ami
  instance_type          = local.instance_type
  subnet_id              = local.subnet_id
  vpc_security_group_ids = [aws_security_group.bar1.id]
  key_name               = local.ec2_key

  root_block_device {
    delete_on_termination = "false"
  }
}

//Securitygroup
resource "aws_security_group" "bar1" {
  name        = "demo-sg"
  description = "SG for demo"
  vpc_id      = local.vpc_id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "public_dns" {
  value = aws_instance.bar1.public_dns
}
