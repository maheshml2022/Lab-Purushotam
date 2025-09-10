
# ---------------- Lookups ----------------
data "azurerm_resource_group" "keyvault_keyvault_with_keys_and_acl" {
  name     = var.keyvault_keyvault_with_keys_and_acl_resource_group_name
  provider = azurerm.keyvault_keyvault_with_keys_and_acl

  depends_on = [
    module.resourcegroup_basic_example
  ]
}

data "azurerm_virtual_network" "keyvault_keyvault_with_keys_and_acl" {
  name                = var.keyvault_keyvault_with_keys_and_acl_vnet
  resource_group_name = var.keyvault_keyvault_with_keys_and_acl_vnet_resource_group_name
  provider            = azurerm.keyvault_keyvault_with_keys_and_acl
}

data "azurerm_subnet" "keyvault_keyvault_with_keys_and_acl" {
  name                 = var.keyvault_keyvault_with_keys_and_acl_subnet_name
  virtual_network_name = data.azurerm_virtual_network.keyvault_keyvault_with_keys_and_acl.name
  resource_group_name  = data.azurerm_virtual_network.keyvault_keyvault_with_keys_and_acl.resource_group_name
  provider             = azurerm.keyvault_keyvault_with_keys_and_acl
}

# ---------------- Key Vault module ----------------
module "keyvault_keyvault_with_keys_and_acl" {
  source  = "jlqpztfe01.onefiserv.net/fiserv-main/keyvault/azurerm"
  version = "1.2.0" # Example. Choose the latest version

  providers = {
    azurerm               = azurerm.keyvault_keyvault_with_keys_and_acl
    azurerm.kv_privateDNS = azurerm.kv_privateDNS
  }

  resource_group_name  = data.azurerm_resource_group.keyvault_keyvault_with_keys_and_acl.name
  keyvault_location    = data.azurerm_resource_group.keyvault_keyvault_with_keys_and_acl.location
  kv_name              = var.keyvault_keyvault_with_keys_and_acl_name
  sku_name             = "standard"

  enabled_for_deployment          = false
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = false
  purge_protection_enabled        = true

  # Private endpoint subnet
  pe_subnet_id = data.azurerm_subnet.keyvault_keyvault_with_keys_and_acl.id

  # Network ACLs (from screenshots)
  network_acls = {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.keyvault_keyvault_with_keys_and_acl.id]
  }

  # Keys
  key1 = var.keyvault_keyvault_with_keys_and_acl_key1
  keys = var.keyvault_keyvault_with_keys_and_acl_keys

  # Access policies (accp1 example from screenshots)
  access_policies = {
    "accp1" = {
      group_names           = []
      object_ids            = []
      user_principal_names  = []
      certificate_permissions = [
        "Get","List","Update","Create","Import","Delete","Recover",
        "ManageIssuers","GetIssuers","ListIssuers","SetIssuers","DeleteIssuers"
      ]
      key_permissions = [
        "Get","List","Update","Create","Import","Delete","Recover","Backup","Restore"
      ]
      secret_permissions = [
        "Get","List","Set","Delete","Recover","Backup","Restore"
      ]
      storage_permissions = ["Get","List"]
    }
  }

  # ServiceNow passthroughs (declared in variables)
  service_now_email                           = var.service_now_email
  service_now_assignment_group_name           = var.service_now_assignment_group_name
  service_now_validation_assignment_group_name = var.service_now_validation_assignment_group_name

  # Private DNS inputs
  private_dns_zone_name                = var.private_dns_zone_name
  private_dns_zone_resourcegroup       = var.private_dns_zone_resourcegroup
  private_dns_zone_shared_subscription = var.private_dns_zone_shared_subscription

  # Extra tags
  kv_additional_tags = {
    iac = "Terraform"
    env = var.keyvault_keyvault_with_keys_and_acl_environment
  }
}
