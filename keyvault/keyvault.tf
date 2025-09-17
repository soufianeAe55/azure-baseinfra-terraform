data "azurerm_client_config" "current" {}

module "keyvault" {
  source                          = "git@ssh.dev.azure.com:v3/ORG-NAME/escape-mod/terraform-azurerm-keyvault-fork-tka-ext//module?ref=master"
  custom_name                     = local.keyvault_custom_name
  stack                           = var.stack
  landing_zone_slug               = var.landing_zone_slug
  default_tags                    = module.base_tagging.base_tags
  location                        = module.regions.location
  location_short                  = module.regions.location_short
  resource_group_name             = var.use_new_rg_for_kv ? module.keyvault_resource_group[0].resource_group_name : local.keyvault_rg_name
  diag_log_analytics_workspace_id = var.log_analytics_workspace_id
  diag_log_categories             = ["AuditEvent"]
  diag_metric_categories          = ["AllMetrics"]
  sku                             = "standard"
  enabled_for_deployment          = true                                                      // we want azure VMs to be able to retrieve secrets from vault
  enabled_for_disk_encryption     = true                                                      // we want disk encryption to be enabled for secret storage
  enabled_for_template_deployment = false                                                     // we do not use ARM templates, therefore, we disable it 
  enabled_rbac_authorization      = true                                                      // we want to use Azure RBAC roles for Access control, for this project 
  purge_protection_enabled        = local.purge_protection_enabled_per_env[var.environment]   // we want to prevent deletion/purge, before retention period end, of soft deleted secrets. it cannot be disabled
  soft_delete_retention_days      = local.soft_delete_retention_days_per_env[var.environment] // we want to keep deleted secrets as long as possible, for eventual recovery
  public_network_access_enabled   = false
  enable_private_endpoint         = true
  private_endpoint_subnet_id      = var.private_endpoint_subnet_id
  private_endpoint_asg_id         = var.private_endpoint_asg_id
  private_dns_zone_id             = var.keyvault_private_dns_zone_id

  tenant_id            = data.azurerm_client_config.current.tenant_id
  use_kv_access_policy = false // given that we rely on Azure RBAC model, and not on traditional access policies, do do not need this feature
}