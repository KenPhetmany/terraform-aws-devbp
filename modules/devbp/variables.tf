// "10.0.0.0/16"
variable "vpc_cidr_block" {type=string}
variable "enable_dns_hostnames" {type=bool}
variable "vpc_description" {type=string}
variable "vpc_name" {type=string}
variable "subnets" {
  description = "subnets to be installed in the vpc"
  type        = map(any)
}