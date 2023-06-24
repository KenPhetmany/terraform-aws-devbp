output "vpc_id" { value = aws_vpc.vpc.id }
output "subnet_id" { value = {for k, v in aws_subnet.subnet: k => v.id} }