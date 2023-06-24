variable "cp_s3_name" { type = string }

variable "cp_name" { type = string }
variable "cp_role_arn" { type = string }

variable "source_name" { type = string }
variable "source_category" { type = string }
variable "source_owner" { type = string }
variable "source_provider" { type = string }
variable "source_output_artifact" { type = string }
variable "source_version" { type = string }
variable "source_config_repo" { type = string }
variable "source_config_branch_name" { type = string }

 variable "build_name" { type = string }
variable "build_category" { type = string }
variable "build_owner" { type = string }
variable "build_provider" { type = string }
variable "build_output_artifact" { type = string }
variable "build_version" { type = string }
variable "build_config_project_name" { type = string } 

variable "deploy_name" { type = string }
variable "deploy_category" { type = string }
variable "deploy_owner" { type = string }
variable "deploy_provider" { type = string }
variable "deploy_version" { type = string }
variable "deploy_config_cd_name" { type = string }
variable "deploy_config_cd_dg_name" { type = string }
