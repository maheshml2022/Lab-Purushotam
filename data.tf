# ---------------- Lookups ----------------

# Lookup existing resource group in which the Key Vault will be created
data "azurerm_resource_group" "keyvault_keyvault_with_keys_and_acl" {
  name     = var.keyvault_keyvault_with_keys_and_acl_resource_group_name
  provider = azurerm.keyvault_keyvault_with_keys_and_acl

  depends_on = [
    module.resourcegroup_basic_example
  ]
}

# Lookup existing virtual network
data "azurerm_virtual_network" "keyvault_keyvault_with_keys_and_acl" {
  name                = var.keyvault_keyvault_with_keys_and_acl_vnet
  resource_group_name = var.keyvault_keyvault_with_keys_and_acl_vnet_resource_group_name
  provider            = azurerm.keyvault_keyvault_with_keys_and_acl
}

# Lookup existing subnet
data "azurerm_subnet" "keyvault_keyvault_with_keys_and_acl" {
  name                 = var.keyvault_keyvault_with_keys_and_acl_subnet_name
  virtual_network_name = data.azurerm_virtual_network.keyvault_keyvault_with_keys_and_acl.name
  resource_group_name  = data.azurerm_virtual_network.keyvault_keyvault_with_keys_and_acl.resource_group_name
  provider             = azurerm.keyvault_keyvault_with_keys_and_acl
}
