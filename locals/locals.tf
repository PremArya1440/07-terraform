locals {
    instance_name = "${var.name}-${var.environment}"
    instance_type = "t3.micro"
    common_tags ={
          project = "roboshop"
    Terraform = "true"
    Environment = "dev"
    }
    ec2_final_tags = merge(local.common_tags, var.ec2_tags) 
    # tf run this and this result will goes to the local.ec2_final_tags
      ami   = data.aws_ami.joindevops.id
}