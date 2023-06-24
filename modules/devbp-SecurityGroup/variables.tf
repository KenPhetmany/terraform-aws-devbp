variable "sg_name" {type=string}
variable "vpc_id" {type=string}
variable "sg_ingress_rules" {
  description = "Map of Security Group rules"
  type        = map(any)
}
variable "sg_egress_rules" {
  description = "Map of Security Group rules"
  type        = map(any)
}