
/* 
  Create a VPC network for project's environment. Any tool/resources will be built under this network. 
*/
resource "aws_vpc" "vpc" {
  // Assign group of addresses in the same prefix
  // Only the remaining 8 bits are able to be used
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    "Name"        = "${var.vpc_name}"
    "Description" = "${var.vpc_description}"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  for_each                = var.subnets
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch


  tags = {
    "Name"        = "${each.key}"
    "Description" = "${each.value.subnet_description}"
  }

}

