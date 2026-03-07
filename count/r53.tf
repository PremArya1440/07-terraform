resource "aws_route53_record" "www" {
    count = 10
  zone_id = var.zonde_id
  #interpolation
 #name    ="${var.instnaces[count.index]}.${var.domain_name}.${string [var.cricket]}" #mongodb.daws88s.online
 name = "${var.instnaces[count.index]}.${var.domain_name}.${tolist(var.cricket)[0]}"
  type    = "A" #c E
  ttl     = 1
  records = [aws_instance.robo_shop_88s[count.index].private_ip]
}