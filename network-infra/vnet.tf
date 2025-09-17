module "vnet" {
  source            = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-vnet//module?ref=1.0.3"
  stack             = var.stack
  custom_name       = local.vnet_name
  landing_zone_slug = var.landing_zone_slug
  default_tags      = module.base_tagging.base_tags
  location          = module.regions.location
  location_short    = module.regions.location_short
  resource_group_name = local.virtual_network_rg_name
  virtual_network_address_space = ["${var.vnet_classA_address_network_portion}.0.0/16"]
  diag_log_analytics_workspace_id = var.log_analytics_workspace_id
  depends_on = [module.network_infra_resource_group]
}