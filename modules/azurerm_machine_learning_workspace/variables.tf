
variable ml_prefix {
  type = string
  default = null
}

variable "ml_rg_name" {
  type = string
}

variable "ml_location" {
  type = string
}
variable ml_workspace_name {
  default = "ml-workspace"
}

variable "tags" {
  description = "Map of tags to be placed on the Resources"
  type        = map
}

variable "application_insights_id" {
  default = null
}

variable "key_vault_id" {
  default = null
}

variable "storage_account_id" {
  default = null
}

variable "acr_id" {
  default = null
}

variable "synapse_spark_pool_id" {
  default = null
}