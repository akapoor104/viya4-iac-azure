output "azure_storage_id" {
  value = azurerm_storage_account.azure_storage_account.id
}

output "azure_storage_name" {
  value = azurerm_storage_account.azure_storage_account.name
}

output "azure_storage_datalake_id" {
  value = azurerm_storage_data_lake_gen2_filesystem.datalake.id
}

output "azure_storage_datashare_id" {
  value = azurerm_storage_share.datashare.id
}

output "azure_storage_primary_connection_string" {
  value = azurerm_storage_account.azure_storage_account.primary_connection_string
}