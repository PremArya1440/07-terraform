resource "aws_route53_record" "www" {
    for_each = aws_instance.example
 
  zone_id = var.zone_id
  #interpolation
 #name    ="${var.instnaces[count.index]}.${var.domain_name}.${string [var.cricket]}" #mongodb.daws88s.online
 name = "${each.key}.${var.domain_name}"
  type    = "A" #c E
  ttl     = 1
  records = [each.value.private_ip ]
  allow_overwrite = true
}
