variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "nacl_name" { type = string }
variable "nacl_config" {
  description = "NACL configuration"
  type        = map(any)
}
