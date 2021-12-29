# Azure Machine Learning Workspace - https://azure.microsoft.com/en-gb/services/machine-learning/
# Azure Docs
# - https://docs.microsoft.com/en-gb/azure/machine-learning/overview-what-is-azure-machine-learning
# - https://docs.microsoft.com/en-us/azure/machine-learning/how-to-run-jupyter-notebooks

# Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_workspace

resource "azurerm_machine_learning_workspace" "azure_ml_workspace" {
  name                    = "${var.ml_prefix}-${var.ml_workspace_name}"
  location                = var.ml_location
  resource_group_name     = var.ml_rg_name
  application_insights_id = var.application_insights_id
  key_vault_id            = var.key_vault_id
  storage_account_id      = var.storage_account_id
  container_registry_id   = var.acr_id
  tags                    = var.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_machine_learning_synapse_spark" "azure_ml_synapse_spark" {
  name                          = "${var.ml_prefix}-sypse-spk"
  machine_learning_workspace_id = azurerm_machine_learning_workspace.azure_ml_workspace.id
  location                      = var.ml_location
  synapse_spark_pool_id         = var.synapse_spark_pool_id

  identity {
    type = "SystemAssigned"
  }
}