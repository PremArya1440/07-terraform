variable "instances" {
type= map(string)
default = {
  
  mongodb = "t3.micro"
  mysql = "t3.small"
  user = "t3.micro"
  shipping = "t3.small"
}
}
variable "zone_id" {
  default = "Z0425694W58WDQOZHX5V"
}

variable "domain_name" {
  default = "4sinfotech.in"
}

  #interpolation
 #name    ="${var.instnaces[count.index]}.${var.domain_name}.${string [var.cricket]}" #mongodb.daws88s.online
