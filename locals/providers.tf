terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }

  backend "s3" {
    bucket         = "prem1st-s3-remote-state-88s" #replace with your unique bucket name  prem1st-s3-remote-state-88s 
    key            = "locals-demo.tfstate" # we can't use the same key names
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}


provider "aws" {
  region = "us-east-1"
}

