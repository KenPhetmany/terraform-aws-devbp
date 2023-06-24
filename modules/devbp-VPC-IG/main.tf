resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc_id
  tags = {
    "Name"        = "${var.ig_name}"
    "Description" = "${var.ig_description}"
  }
}

/*
  Route table to route all traffic from public subnet to any host through IG
  Tells network packets which way they need to go to get to their destination 
  Managed by routers which as as "intersections" within the network, connecting multiple routes together
  AWS VPC router takes all route tables defined within that VPC and direct traffic flow 
*/
resource "aws_route_table" "pb_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.pb_rt_cidr_block
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    "Name"        = "${var.pb_rt_name}"
    "Description" = "${var.pb_rt_description}"
  }
}

/*
  Associate any public subnet with the route table 
 'subnet_public_sample' is now accessible over the public internet
 */
resource "aws_route_table_association" "pb_rta" {
  subnet_id      = var.pb_subnet_id
  route_table_id = aws_route_table.pb_rt.id
}