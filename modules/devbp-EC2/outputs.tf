output "public_ip" {
  value = aws_instance.gomon_ec2.public_ip
}

output "ec2_name" {
  value = var.ec2_name
}
