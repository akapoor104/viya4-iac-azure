variable storage_account_prefix {
  type = string
  default = null
}

variable storage_account_name {
  description = "Storage Account to be used for SAS Viya"
  default = "viya_storage_account"
}

variable storage_account_tier {
  default = "Standard"
}

variable storage_account_replication_type {
  default = "LRS"
}

variable storage_account_location {
  default = "US East"
}

variable storage_account_rg {
  default = null
}

# "StorageV2" or "BlobStorage"
variable storage_account_kind {
  default = "StorageV2"
}

variable "tags" {
  description = "Map of tags to be placed on the Resources"
  type        = map
}