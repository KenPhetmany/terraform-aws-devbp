resource "aws_security_group" "security_group" {
  name   = var.sg_name
  vpc_id = var.vpc_id
  tags = {
    "Name" = "${var.sg_name}"
  }
}

resource "aws_vpc_security_group_egress_rule" "egress_rules" {
  security_group_id = aws_security_group.security_group.id

  for_each   = var.sg_ingress_rules
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.protocol
  cidr_ipv4   = each.value.cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  security_group_id = aws_security_group.security_group.id

  for_each   = var.sg_egress_rules
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.protocol
  cidr_ipv4   = each.value.cidr_block
}