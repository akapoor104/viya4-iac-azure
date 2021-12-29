resource "azurerm_resource_group" "azure_rg" {
  name     = "${var.name}"
  location = var.location
  tags     = var.tags
}