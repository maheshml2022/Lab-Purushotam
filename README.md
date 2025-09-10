
# terraform-azurerm-keyvault: With Keys and ACL

This project provisions an Azure Key Vault with keys, ACLs, access policies, and Private DNS integration. It also supports optional creation of a new resource group via an internal module.

## Quick start
1. Update provider authentication in `keyvault_with_keys_and_acl.tf` as needed.
2. Fill in variables via `*.tfvars` or environment variables.
3. `terraform init && terraform plan`

The provider block mirrors the screenshot defaults enabling soft-delete recovery for key vaults, keys, and secrets.
