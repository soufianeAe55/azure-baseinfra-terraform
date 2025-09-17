module "log_analytics_workspace" {
  source              = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-loganalyticsworkspace//module?ref=master"
  custom_name         = "${var.application}${local.component_append}-ws-${var.environment}"
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  location            = module.regions.location
  location_short      = module.regions.location_short
  resource_group_name = local.observability_rg_name
  default_tags        = module.base_tagging.base_tags
  diag_metric_categories = ["AllMetrics"]
  sku                 = var.log_analytics_sku
  internet_ingestion_enabled = false
  internet_query_enabled = true
  diag_retention_days = var.retention_in_days
  depends_on = [module.monitoring_resource_group]
}