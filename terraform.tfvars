subscription_id                  = "<sub-id-for-kv>"
tenant_id_privateDNS            = "<tenant-id-or-null>"
client_id_privateDNS            = "<app-id-or-null>"
client_secret_privateDNS        = "<secret-or-null>"
subscription_id_kvPrivateDNS    = "<sub-id-for-private-dns>"

keyvault_resource_group_name    = "rg-app-kv-prod"
vnet_resource_group_name        = "rg-network-prod"
vnet_name                       = "vnet-hub-prod"
pe_subnet_name                  = "snet-priv-endpoints"

keyvault_keyvault_with_keys_and_acl_name = "kv-prod-core-01"
keyvault_keyvault_with_keys_and_acl_key1 = ""

keyvault_keyvault_with_keys_and_acl_keys = {
  app1 = { name = "app1-cmk" }
  app2 = { name = "app2-cmk" }
}

private_dns_zone_name              = "privatelink.vaultcore.azure.net"
private_dns_zone_resourcegroup     = "prod-bluecat-dns-ofs-hybrid-shared-dns-rg"
private_dns_zone_shared_subscription = "<shared-dns-sub-id>"

environment = "Prod"
owner       = "Security"