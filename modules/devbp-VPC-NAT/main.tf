resource "aws_eip" "eip_pv" {
  vpc = true
}

/* NAT gateway allows resources in the private subnet to connect to the internet */
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip_pv.id
  subnet_id     = var.pv_subnet_id
}

/* Route traffic to internet */
resource "aws_route_table" "pv_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.pv_rt_cidr_block
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    "Name"        = "${var.pv_rt_name}"
    "Description" = "${var.pv_rt_description}"
  }

}

/* Associate private subnet with the routing */
resource "aws_route_table_association" "pv_rta" {
  subnet_id      = var.pv_subnet_id
  route_table_id = aws_route_table.pv_rt.id

}
