
# ---------------- Core placement ----------------
variable "keyvault_keyvault_with_keys_and_acl_resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "keyvault_keyvault_with_keys_and_acl_subscription_id" {
  description = "The subscription id in which resource group will be created"
  type        = string
}

variable "keyvault_keyvault_with_keys_and_acl_name" {
  description = "Name for Key Vault to be provisioned"
  type        = string
}

variable "keyvault_keyvault_with_keys_and_acl_vnet" {
  description = "VNet name for the resource to be provisioned"
  type        = string
}

variable "keyvault_keyvault_with_keys_and_acl_vnet_resource_group_name" {
  description = "Resource group of VNet"
  type        = string
}

variable "keyvault_keyvault_with_keys_and_acl_subnet_name" {
  description = "Subnet to add to ACL for this Key Vault"
  type        = string
}

variable "keyvault_keyvault_with_keys_and_acl_environment" {
  description = "Tag: Environment (Dev/QA/Staging/Prod etc)"
  type        = string
}

# ---------------- DNS / cross-subscription auth ----------------
variable "client_id_privateDNS" {
  type        = string
  description = "Client ID for Private DNS access"
  default     = null
}
variable "client_secret_privateDNS" {
  type        = string
  description = "Client secret for Private DNS access"
  default     = null
}
variable "tenant_id_privateDNS" {
  type        = string
  description = "Tenant ID for Private DNS access"
  default     = null
}
variable "subscription_id_kvPrivateDNS" {
  type        = string
  description = "Subscription ID for the shared Private DNS Zone"
}

# ServiceNow (as per screenshots)
variable "service_now_email" {
  type        = string
  description = "email address needed to create a service now request."
  default     = ""
}

variable "service_now_assignment_group_name" {
  type        = string
  description = "Name of a service now assignment for your business unit"
  default     = ""
}

variable "service_now_validation_assignment_group_name" {
  type        = string
  description = "Name of a service now validation assignment for your business unit"
  default     = ""
}

# Private DNS inputs
variable "private_dns_zone_name" {
  type        = string
  description = "Private DNS Zone Name of Key Vault"
}

variable "private_dns_zone_resourcegroup" {
  type        = string
  description = "Resource Group of Private DNS Zone Name"
  default     = "prod-bluecat-dns-ofs-hybrid-shared-dns-rg"
}

variable "private_dns_zone_shared_subscription" {
  type        = string
  description = "Subscription ID for the shared Private DNS Zone"
}

# Optional new RG creation
variable "create_new_resource_group" {
  description = "set to true if new resource group must be created"
  type        = bool
  default     = false
}

variable "resourcegroup_basic_example_resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = null
}

variable "resourcegroup_basic_example_location" {
  description = "Resource group location"
  type        = string
  default     = null
}

variable "resourcegroup_basic_example_environment" {
  description = "Resource group environment"
  type        = string
  default     = null
}

# Keys
variable "keyvault_keyvault_with_keys_and_acl_key1" {
  description = "Key1 value could be used for CMK"
  type        = string
  default     = ""
}

variable "keyvault_keyvault_with_keys_and_acl_keys" {
  description = "Map of keys for Key Vault"
  type = map(object({
    name = string
  }))
  default = {}
}
