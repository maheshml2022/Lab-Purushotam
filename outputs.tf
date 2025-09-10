
output "key_vault_name" {
  value = module.keyvault_keyvault_with_keys_and_acl.kv_name
}

output "key_vault_id" {
  value = try(module.keyvault_keyvault_with_keys_and_acl.key_vault_id, null)
}

output "resource_group_name" {
  value = data.azurerm_resource_group.keyvault_keyvault_with_keys_and_acl.name
}
