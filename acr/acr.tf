module "steerin_acr" {
  source                          = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-acr//module?ref=1.4.0"
  custom_name                     = local.acr_custom_name
  stack                           = var.stack
  landing_zone_slug               = var.landing_zone_slug
  location                        = module.regions.location
  location_short                  = module.regions.location_short
  resource_group_name             = local.acr_rg_name
  default_tags                    = module.base_tagging.base_tags
  diag_log_analytics_workspace_id = var.log_analytics_workspace_id

  admin_enabled                   = true //We want to create the admin for our acr
  public_network_access_enabled   = true
  enable_private_endpoint         = false
}

