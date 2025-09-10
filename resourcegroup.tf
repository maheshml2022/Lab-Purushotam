
# Optional resource group creation (matches screenshots incl. ternary)
module "resourcegroup_basic_example" {
  count   = var.create_new_resource_group ? 1 : 0
  source  = "git@git-enterprise-jc.onefiserv.net:platform-automation/terraform-modules/terraform-azurerm-resourcegroup-basic-example"

  providers = {
    azurerm = azurerm.resourcegroup_basic_example
  }

  name       = var.resourcegroup_basic_example_resource_group_name
  location   = var.resourcegroup_basic_example_location
  environment = var.resourcegroup_basic_example_environment
  tags = {
    example-additional-tag = "example-additional-tag"
  }
}
