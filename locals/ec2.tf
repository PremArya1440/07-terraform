resource "aws_instance" "example" { #second these steps 
  ami                    = local.ami
  instance_type          = local.instance_type  
  vpc_security_group_ids = [aws_security_group.allow_tls.id] #VPC Security Group ID is the unique identifier (sg-xxxx) used to reference and attach a security group to AWS resources.
   
   tags = local.ec2_final_tags
#   tags = {  
#     Name    = local.instance_name
#     Project = "roboshop"
  }


resource "aws_security_group" "allow_tls"{ #first these steps
  name        = "allow-dynamic-terraform-remote-state" # this is for AWS account
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 ingress { 
    from_port        = 0
    to_port          = 0 
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "allow-dynamic-terraform-remote-state"
  }
}
