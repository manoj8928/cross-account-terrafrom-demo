
locals {

  ami           = "<Provide AMI ID>"
  instance_type = "t2.micro"

  subnet_id = "<Provide subnet id>"
  vpc_id    = "<Provide VPC id>"

}

data "aws_route53_zone" "zone" {
  name         = "bar.example.org"
  private_zone = false
  provider     = "aws.route53"
}
