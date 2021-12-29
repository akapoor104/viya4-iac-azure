output "synapse_spark_pool_id" {
  value = azurerm_synapse_spark_pool.sparkpool.id
}

output "synapse_spark_pool_name" {
  value = azurerm_synapse_spark_pool.sparkpool.name
}

output "synapse_sql_pool_name" {
  value = azurerm_synapse_sql_pool.sqlpool.name
}

output "synapse_workspace_url" {
  value = azurerm_synapse_workspace.azure_synapse_workspace.connectivity_endpoints
}