#Terraform AWS instance

This module create EC2 instance in aws.

#inputs

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
