module "vpc" {
  source      = "git::https://github.com/PremArya1440/terraform-aws-vpc.git?ref=main"
  project     = "roboshop"
  environment = "dev"

}
