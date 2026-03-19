##Terraform AWS instance

This module create EC2 instance in aws.

##inputs

* project -(Required) string type, user must provide project name ex. roboshop, expense, etc
* environment - (Required) string type, user must provide environment ex. dev, uat, pod, etv.
* ami_id - (Required) string type, user must provide ami_id of the instance.
* instance_type - (optional )string type,default value is t3.micro.user can override. 
* sg_ids -(Required)list of string, users must provide list of security group ids instance should have.
* tags - (Required) list tytpe, user can provide the tags they want to have

## Ouputs
* Instance_id - ID of the instance created
* public_ip - Public IP of the instance created
* private_ip - private IP of the instance created



Here’s a clear, interview-ready explanation of **how to create a Terraform module that provisions an EC2 instance in AWS**.

---

## 🔹 What is a Terraform Module?

A **module** in Terraform is a reusable set of configuration files used to create resources.

👉 Think of it like a **function** in programming — you write once and reuse multiple times.

---

## 🔹 Step 1: Create Module Folder Structure

```
terraform-project/
│
├── main.tf              # Root module
├── variables.tf
├── outputs.tf
│
└── modules/
    └── ec2-instance/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## 🔹 Step 2: Write EC2 Module Code

### 📄 `modules/ec2-instance/main.tf`

```hcl
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
```

---

### 📄 `modules/ec2-instance/variables.tf`

```hcl
variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "Name tag for EC2"
  type        = string
}
```

---

### 📄 `modules/ec2-instance/outputs.tf`

```hcl
output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}
```

---

## 🔹 Step 3: Call Module from Root Module

### 📄 `main.tf` (root)

```hcl
provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source = "./modules/ec2-instance"

  ami_id         = "ami-0abcdef1234567890"
  instance_type  = "t2.micro"
  instance_name  = "MyTerraformEC2"
}
```

---

## 🔹 Step 4: Optional Root Outputs

```hcl
output "instance_id" {
  value = module.ec2.instance_id
}

output "public_ip" {
  value = module.ec2.public_ip
}
```

---

## 🔹 Step 5: Run Terraform

```bash
terraform init
terraform plan
terraform apply
```

---

## 🔹 Key Points (Interview Tips)

* Modules improve **reusability & maintainability**
* Can be:

  * **Local module** → `./modules/ec2-instance`
  * **Remote module** → GitHub, Terraform Registry
* Inputs → `variables.tf`
* Outputs → `outputs.tf`
* Logic → `main.tf`

---

## 🔹 Bonus (Advanced Tip)

You can reuse this module multiple times:

```hcl
module "ec2_dev" {
  source = "./modules/ec2-instance"
  ami_id = "ami-xyz"
  instance_type = "t2.micro"
  instance_name = "Dev-Instance"
}

module "ec2_prod" {
  source = "./modules/ec2-instance"
  ami_id = "ami-xyz"
  instance_type = "t2.large"
  instance_name = "Prod-Instance"
}
```

---

If you want, I can also give:
✅ Terraform module with **VPC + EC2 + Security Group**
✅ Real-time **DevOps interview Q&A on Terraform modules**
