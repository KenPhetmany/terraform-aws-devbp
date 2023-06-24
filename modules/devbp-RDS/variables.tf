variable "db_sg_name" { type = string }
variable "vpc_id" { type = string }
variable "security_groups" { type = string }

variable "engine" { type = string }
variable "identifier" { type = string }
variable "db_name" { type = string }
variable "allocated_storage" { type = number }
variable "instance_class" { type = string }
variable "db_subnet_group_name" { type = string }

variable "username" { type = string }
variable "password" { type = string }
variable "publicly_accessible" { type = bool }

variable "subnet_ids" { type    = list(string)}
