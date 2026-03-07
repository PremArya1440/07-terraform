resource "aws_instance" "example" { #second these steps 
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? "t3.micro" : "t3.small" #In variable it is in prod ,so it will fail, so t3.small 
  vpc_security_group_ids = [aws_security_group.allow.id] #VPC Security Group ID is the unique identifier (sg-xxxx) used to reference and attach a security group to AWS resources.

  tags = var.ec2_tags 
}

resource "aws_security_group" "allow" { #first these steps
  name        = "allow-terraformAll" # this is for AWS account
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
   from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"      
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
  
}


