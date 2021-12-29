resource "azurerm_synapse_workspace" "azure_synapse_workspace" {
  name                                 = "${var.synapse_prefix}-${var.synapse_workspace_name}"
  resource_group_name                  = var.synapse_rg
  location                             = var.synapse_location
  storage_data_lake_gen2_filesystem_id = var.synapse_gen2_storage_id
  sql_administrator_login              = var.synapse_admin_login
  sql_administrator_login_password     = var.synapse_admin_password
  managed_virtual_network_enabled = true
  compute_subnet_id = var.compute_subnet_id

  tags = var.tags
}

resource "azurerm_synapse_sql_pool" "sqlpool" {
  name                 = "${var.synapse_prefix}sqlpool"
  synapse_workspace_id = azurerm_synapse_workspace.azure_synapse_workspace.id
  sku_name             = var.synapse_sqlpool_sku_name
  create_mode          = "Default"

  tags = var.tags
}

resource "azurerm_synapse_spark_pool" "sparkpool" {
  name                 = "${var.synapse_prefix}sparkpool"
  synapse_workspace_id = azurerm_synapse_workspace.azure_synapse_workspace.id
  node_size_family     = "MemoryOptimized"
  node_size            = "Small"
  cache_size           = 100
  spark_version        = var.spark_version

  auto_scale {
    max_node_count = 4
    min_node_count = 3
  }

  auto_pause {
    delay_in_minutes = 15
  }

  library_requirement {
    content  = <<EOF
appnope==0.1.0
beautifulsoup4==4.6.3
EOF
    filename = "requirements.txt"
  }

  spark_config {
    content  = <<EOF
spark.shuffle.spill                true
EOF
    filename = "config.txt"
  }

  timeouts {
    create = "30m"
    delete = "30m"
  }

  tags = var.tags
}

resource "azurerm_synapse_firewall_rule" "allow_sasvpn_firewall" {
  name                 = "AllowAllSasVpn"
  synapse_workspace_id = azurerm_synapse_workspace.azure_synapse_workspace.id
  start_ip_address     = "149.173.0.0"
  end_ip_address       = "149.173.255.255"
}

resource "azurerm_synapse_firewall_rule" "azure_firewall" {
  name                 = "AllowAllWindowsAzureIps"
  synapse_workspace_id = azurerm_synapse_workspace.azure_synapse_workspace.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "0.0.0.0"
}

resource "azurerm_synapse_linked_service" "storage_linked_service" {
  name                 = "storage_linked_service"
  synapse_workspace_id = azurerm_synapse_workspace.azure_synapse_workspace.id
  type                 = "AzureBlobStorage"
  type_properties_json = <<JSON
{
  "connectionString": "${var.storage_connection}"
}
JSON

  depends_on = [
    azurerm_synapse_firewall_rule.allow_sasvpn_firewall,azurerm_synapse_firewall_rule.azure_firewall
  ]
}