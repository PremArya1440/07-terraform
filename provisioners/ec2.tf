resource "aws_instance" "example" { #second these steps 
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id] #VPC Security Group ID is the unique identifier (sg-xxxx) used to reference and attach a security group to AWS resources.
 
 #self is the special variable
  provisioner "local-exec" {
    command = "echo '${self.public_ip}' > inventory.ini" # why this (public Ip was stored in inventory.ini)
  }

  tags = {  
    Name    = "provisioners-demo"
    Project = "roboshop"
  }
}

resource "aws_security_group" "allow_tls" { #first these steps
  name        = "allow-tfdatasources-terraform" # this is for AWS account
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
    Name = "allow-tfdatasources-terraform"
  }
}