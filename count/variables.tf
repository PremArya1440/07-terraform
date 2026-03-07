variable "instnaces" {
type = list
default = ["mongodb", "redis", "mysqal", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}
#repolace with my zone_ID  and domain_name
variable "zonde_id" {
  
  default = "Z0425694W58WDQOZHX5V"
}

variable "domain_name" {
    default = "4sinfotech.in"
  
}

variable "cricket" {
  type    = list(string)
  default = ["test", "oneday", "t20", "ipl","oneday"]
}

variable "cricket_set" {
  type    = set(string)
  default = ["onday","test", "oneday", "t20", "ipl"]
}

#resource "aws_resource_group" "example" {
  #for_each = var.environments
  #name     = each.value // or each.key
  #tags = {
   # Environment = each.value
  #}
#}
