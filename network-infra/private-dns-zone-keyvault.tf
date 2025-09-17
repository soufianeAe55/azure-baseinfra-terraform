module "keyvault_private_dns_zone" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-privatednszone//module?ref=1.0.3"

  domain_name         = local.keyvault_private_dns_zone_name
  resource_group_name = module.private_dns_zone_resource_group.resource_group_name

  default_tags = module.base_tagging.base_tags

  virtual_network_link_ids = [ module.vnet.virtual_network_id ]
}