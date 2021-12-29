variable azure_application_insights_prefix {
  type = string
  default = null
}

variable azure_application_insights_rg {
  description = "Name of the existing resource group"
  type = string
  default = null
}
variable azure_application_insights_location {
  description = "The Azure Region to provision resources"
  default     = "East US"
}

variable azure_application_insights_name {
  description = "Azure Application Insight Name"
  default = "viya_application_insights"
}

variable azure_application_insights_type {
  default = "web"
}

variable "tags" {
  description = "Map of tags to be placed on the Resources"
  type        = map
}