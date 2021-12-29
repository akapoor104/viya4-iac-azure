variable key_vault_prefix {
  type = string
  default = null
}

variable key_vault_rg {
  description = "Name of the existing resource group"
  type = string
  default = null
}
variable key_vault_location {
  description = "The Azure Region to provision resources"
  default     = "East US"
}

variable key_vault_name {
  default = "key-vault"
}

variable key_tenant_id {
  default = null
}

variable key_vault_sku_name {
  description = "Key Vault SKU"
  default = "premium"
}

variable "tags" {
  description = "Map of tags to be placed on the Resources"
  type        = map
}