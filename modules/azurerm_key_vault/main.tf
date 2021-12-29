# Azure Key Vault: https://azure.microsoft.com/en-gb/services/key-vault/
# Azure Docs
# - 
# - 

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault

resource "azurerm_key_vault" "azure_key_vault" {
  name                      = "${var.key_vault_prefix}-${var.key_vault_name}"
  location                  = var.key_vault_location
  resource_group_name       = var.key_vault_rg
  tenant_id                 = var.key_tenant_id
  sku_name                  = var.key_vault_sku_name
  tags                      = var.tags
}