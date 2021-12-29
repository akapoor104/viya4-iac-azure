# !NOTE! - These are only a subset of CONFIG-VARS.md provided as examples.
# Customize this file to add any variables from 'CONFIG-VARS.md' whose default
# values you want to change.

# ****************  REQUIRED VARIABLES  ****************
# These required variables' values MUST be provided by the User
prefix   = "<prefix-value>" # this is a prefix that you assign for the resources to be created
location = "<azure-location-value>" # e.g., "centralus"

# ****************  REQUIRED VARIABLES  ****************

# !NOTE! - Without specifying your CIDR block access rules, ingress traffic
#          to your cluster will be blocked by default.

# **************  RECOMMENDED  VARIABLES  ***************
default_public_access_cidrs = [] # e.g., ["123.45.6.89/32"]
ssh_public_key = "~/.ssh/id_rsa.pub" # Name of file with public ssh key for connecting to the VMs
# **************  RECOMMENDED  VARIABLES  ***************

# Tags can be specified matching your tagging strategy.
# for example: { "owner|email" = "<you>@<domain>.<com>", "key1" = "value1", "key2" = "value2" }
tags = {} 

# Postgres config - By having this entry a database server is created. If you do not
#                   need an external database server remove the 'postgres_servers'
#                   block below.
postgres_servers = {
  default = {
    sku_name                     = "MO_Gen5_2"
    storage_mb                   = 51200
    backup_retention_days        = 7
    geo_redundant_backup_enabled = false
    administrator_login          = "pgadmin"
    administrator_password       = "xxxx"
    server_version               = "11"
    ssl_enforcement_enabled      = true
    postgresql_configurations    = { }
  }
}
postgres_public_access_cidrs = []

# Azure Container Registry config
create_container_registry           = true
container_registry_sku              = "Standard"
container_registry_admin_enabled    = false

# AKS config
kubernetes_version         = "1.21.2"
default_nodepool_min_nodes = 1
#v3 still has local temp storage
default_nodepool_vm_type   = "Standard_D4_v3"
create_static_kubeconfig    = true
use_msi = false

# AKS Node Pools config - minimal
cluster_node_pool_mode = "minimal"
node_pools = {
  cas = {
    "machine_type"          = "Standard_E4s_v3"
    "os_disk_size"          = 200
    "min_nodes"             = 0
    "max_nodes"             = 5
    "max_pods"              = 110
    "node_taints"           = ["workload.sas.com/class=cas:NoSchedule"]
    "node_labels" = {
      "workload.sas.com/class" = "cas"
    }
  },generic = {
    "machine_type"          = "Standard_D8s_v3"
    "os_disk_size"          = 200
    "min_nodes"             = 0
    "max_nodes"             = 5
    "max_pods"              = 110
    "node_taints"           = []
    "node_labels" = {
      "workload.sas.com/class"        = "compute"
      "launcher.sas.com/prepullImage" = "sas-programming-environment"
    }
  }
}

# Jump Box
create_jump_public_ip = true
jump_vm_admin        = "jumpuser"
jump_vm_machine_type = "Standard_B2s"
jump_rwx_filestore_path = "/viyashare"
vm_public_access_cidrs = []

# Storage for SAS Viya CAS/Compute
storage_type = "standard"
# required ONLY when storage_type is "standard" to create NFS Server VM
create_nfs_public_ip = false
nfs_vm_admin         = "nfsuser"
nfs_vm_machine_type  = "Standard_D4s_v4"
nfs_raid_disk_size   = 128
nfs_raid_disk_type   = "Standard_LRS"

# Azure Monitor
create_aks_azure_monitor = false

# [AK] Create Data Center
# Setting this to "true" will create
#    Azure Application Insight
#    Azure Key Vault
#    Azure Storage Account (Gen2)
#    Azure Machine Learning Workspace
#    Azure Databricks Workspace
#    Azure Synapse
create_sas_data_center = true
storage_account_name = "storageaccount"
storage_account_tier = "Standard"
storage_account_replication_type = "LRS"

create_dsvm_vm = true
dsvm_vm_machine_type = "Standard_DS1_v2"
dsvm_vm_admin = "dsvmadmin"
create_dsvm_public_ip = true
dsvm_rwx_filestore_path = "/viyashare"
dsvm_os_data_disk = 150

key_vault_name = "key-vault"
key_vault_sku_name = "premium"

synapse_admin_login = "sqladminuser"
synapse_admin_password = "xxxx"
synapse_sqlpool_sku_name = "DW100c"
spark_version = "2.4"

ml_workspace_name = "ml-workspace"

# Networking
vnet_address_space = "10.8.0.0/16"

# AKS Cluster networking
aks_network_plugin = "azure"
aks_service_cidr = "10.7.0.0/16"
aks_pod_cidr = "10.245.0.0/16"
aks_docker_bridge_cidr = "172.17.0.1/16"
aks_dns_service_ip = "10.7.0.10"
cluster_endpoint_public_access_cidrs = []

subnets = {
  aks = {
    "prefixes": ["10.8.0.0/20"],
    "service_endpoints": ["Microsoft.Sql","Microsoft.Storage"],
    "enforce_private_link_endpoint_network_policies": false,
    "enforce_private_link_service_network_policies": false,
    "service_delegations": {},
  },
  gw = {
    "prefixes": ["10.8.128.0/24"],
    "service_endpoints": ["Microsoft.Sql","Microsoft.Storage"],
    "enforce_private_link_endpoint_network_policies": false,
    "enforce_private_link_service_network_policies": false,
    "service_delegations": {},
  },
  misc = {
    "prefixes": ["10.8.129.0/24"],
    "service_endpoints": ["Microsoft.Sql","Microsoft.Storage"],
    "enforce_private_link_endpoint_network_policies": false,
    "enforce_private_link_service_network_policies": false,
    "service_delegations": {},
  },
  nfs = {
    "prefixes": ["10.8.130.0/24"],
    "service_endpoints": ["Microsoft.Storage"],
    "enforce_private_link_endpoint_network_policies": false,
    "enforce_private_link_service_network_policies": false,
    "service_delegations": {},
  },
  synapse = {
    "prefixes": ["10.8.131.0/24"],
    "service_endpoints": ["Microsoft.Storage"],
    "enforce_private_link_endpoint_network_policies": false,
    "enforce_private_link_service_network_policies": false,
    "service_delegations": {},
  },
  databricks = {
    "prefixes": ["10.8.132.0/24"],
    "service_endpoints": ["Microsoft.Storage"],
    "enforce_private_link_endpoint_network_policies": false,
    "enforce_private_link_service_network_policies": false,
    "service_delegations": {},
  }
}
