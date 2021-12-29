resource "azurerm_application_insights" "azure_application_insights" {
  name                      =  "${var.azure_application_insights_prefix}-${var.azure_application_insights_name}"
  location                  = var.azure_application_insights_location
  resource_group_name       = var.azure_application_insights_rg
  application_type          = var.azure_application_insights_type
  tags                      = var.tags
}