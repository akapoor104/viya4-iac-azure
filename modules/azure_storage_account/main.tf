resource "azurerm_storage_account" "azure_storage_account" {
  name                      = "${var.storage_account_prefix}${var.storage_account_name}"
  location                  = var.storage_account_location
  resource_group_name       = var.storage_account_rg
  account_tier              = var.storage_account_tier
  account_replication_type  = var.storage_account_replication_type
  account_kind              = var.storage_account_kind
#Azure ML does not work with HNS https://docs.microsoft.com/en-us/azure/machine-learning/concept-workspace#resources
  is_hns_enabled            = false 
  tags                      = var.tags
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalake" {
  name               = "analytics-datasets"
  storage_account_id = azurerm_storage_account.azure_storage_account.id
}

resource "azurerm_storage_share" "datashare" {
  name              = "analytics-datashare"
  storage_account_name = azurerm_storage_account.azure_storage_account.name
  
  quota = 50
}