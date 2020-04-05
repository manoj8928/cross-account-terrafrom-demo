resource "aws_route53_record" "bar1"{
 zone_id = data.aws_route53_zone.zone.zone_id
 name = "bar1.bar.example.org"
 type = "CNAME"
 ttl = "300"  
 records = ["${aws_instance.bar1.public_dns}"]
provider = "aws.route53"
 }
