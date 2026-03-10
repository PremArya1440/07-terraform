resource "aws_instance" "example" { #second these steps 
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id] #VPC Security Group ID is the unique identifier (sg-xxxx) used to reference and attach a security group to AWS resources.

  tags = {  
    Name    = "dynamic_instnaces"
    Project = "roboshop"
  }
}

resource "aws_security_group" "allow_tls" { #first these steps
  name        = "allow-dynamic-terraform" # this is for AWS account
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 dynamic "ingress" {  #here ingress is going to be a special varible
  for_each =  var.ingress_rules #toset (var.ingress_rules ) it should work
  content {
   from_port         = ingress.value.port
    to_port          = ingress.value.port
    protocol         = "tcp"
    cidr_blocks      = ingress.value.cidr_blocks
    description = ingress.value.description
  }
 }

  tags = {
    Name = "allow-dynamic-terraform"
  }
}