locals {
  
  common_tags = {
    Project = var.project
    Environmnet = var.environment
    Terraform = "true"
  }
  ec2_final_tags = merge (
    local.common_tags,
    var.tags
  )
  }