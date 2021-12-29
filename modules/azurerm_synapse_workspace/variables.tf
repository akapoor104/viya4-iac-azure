variable synapse_prefix {
  type = string
  default = null
}

variable synapse_workspace_name {
  description = "Synapse Workspace Name"
  default = "viya_synapse"
}

variable synapse_rg {
  default = null
}

variable synapse_location {
  default = "US East"
}

variable synapse_gen2_storage_id {
  default = null
}

variable synapse_admin_login {
  default = null
}

variable synapse_admin_password {
  default = null
}

# Possible values are DW100c, DW200c, DW300c, DW400c, DW500c, DW1000c, DW1500c, DW2000c, DW2500c, DW3000c, DW5000c, DW6000c, DW7500c, DW10000c, DW15000c or DW30000c
variable synapse_sqlpool_sku_name {
  default = "DW100c"
}

variable spark_version {
  default = "2.4"
}

variable "tags" {
  description = "Map of tags to be placed on the Resources"
  type        = map
}

variable "storage_connection" {
    default = null
}

variable compute_subnet_id {
    default = null
}