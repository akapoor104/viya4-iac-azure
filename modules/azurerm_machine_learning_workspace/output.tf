# azurerm_machine_learning_workspace
output "azure_ml_workspace_id" {
  value = azurerm_machine_learning_workspace.azure_ml_workspace.id
}

output "azure_ml_workspace_name" {
  value = azurerm_machine_learning_workspace.azure_ml_workspace.name
}

output "azure_ml_workspace_url" {
  value = azurerm_machine_learning_workspace.azure_ml_workspace.discovery_url
}