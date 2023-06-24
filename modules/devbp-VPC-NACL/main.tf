resource "aws_network_acl" "gomon_dev_nacl" {
  vpc_id     =  var.vpc_id
  subnet_ids = var.subnet_ids
  tags = {
    "Name" : "${var.nacl_name}"
  }
}

/* Create a NACL to manage ingoing and outgoing traffic within the public subnet */
resource "aws_network_acl_rule" "acl_rule" {
  for_each = var.nacl_config
  network_acl_id = aws_network_acl.gomon_dev_nacl.id
  protocol       = each.value.protocol
  from_port      = each.value.from_port
  to_port        = each.value.to_port
  icmp_type      = each.value.icmp_type
  icmp_code      = each.value.icmp_code
  cidr_block     = each.value.cidr_block
  rule_number    = each.value.rule_number
  rule_action    = each.value.rule_action
  egress         = each.value.egress

}
