output "instanceID" {
    value = aws_instance.this[*].id
  
}

output "instance_PubIP" {
    value = aws_instance.this[*].public_ip
  
}