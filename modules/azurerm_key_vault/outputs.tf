# azurerm_key_vault
output "key_vault_id" {
  value = azurerm_key_vault.azure_key_vault.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.azure_key_vault.vault_uri
}

output "key_vault_name" {
  value = azurerm_key_vault.azure_key_vault.name
}