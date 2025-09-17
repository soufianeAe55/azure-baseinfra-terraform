module "pip" {

  count = var.skip_ip_creation ? 0 : 1
  source                          = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-publicip//module?ref=1.4.0"
  stack                           = var.stack
  landing_zone_slug               = var.landing_zone_slug
  location                        = module.regions.location
  location_short                  = module.regions.location_short
  resource_group_name             = local.public_ip_rg_name
  custom_name                     = local.public_ip_custom_name
  default_tags                    = module.base_tagging.base_tags
  diag_log_analytics_workspace_id = var.log_analytics_workspace_id
  enable_monitor_diagnostic_setting = false //TODO not enabling it for the moment because some issues on settings and terraform
  diag_log_categories             = ["DDoSMitigationFlowLogs","DDoSMitigationReports","DDoSProtectionNotifications"]
  diag_metric_categories          = ["AllMetrics"]
  log_analytics_destination_type = "Dedicated"
  domain_name_label               = var.domain_name_label

  depends_on = [ module.public_ip_resource_group ]

}

resource "null_resource" "null_ressource_witness_to_prevent_public_ip_deletion" {
  lifecycle {
    prevent_destroy = true
  }
}