output "ec2_output" {
    value = aws_intance.example[each.key].public_key
  
}

