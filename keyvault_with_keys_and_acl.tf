
# Provider used for Key Vault subscription
provider "azurerm" {
  alias = "keyvault_keyvault_with_keys_and_acl"
  features {
    key_vault {
      recover_soft_deleted_key_vaults       = true
      purge_soft_delete_on_destroy          = false
      recover_soft_deleted_keys             = true
      purge_soft_deleted_keys_on_destroy    = false
      recover_soft_deleted_secrets          = true
      purge_soft_deleted_secrets_on_destroy = false
    }
  }
  subscription_id = var.keyvault_keyvault_with_keys_and_acl_subscription_id
}

# Provider used to reach shared Private DNS subscription (if different)
provider "azurerm" {
  alias    = "kv_privateDNS"
  features {}
  subscription_id = var.subscription_id_kvPrivateDNS

  # If you authenticate with a Service Principal to that subscription, wire these:
  # client_id     = var.client_id_privateDNS
  # client_secret = var.client_secret_privateDNS
  # tenant_id     = var.tenant_id_privateDNS
}

# Helper provider for optional RG creation module
provider "azurerm" {
  alias    = "resourcegroup_basic_example"
  features {}
}
