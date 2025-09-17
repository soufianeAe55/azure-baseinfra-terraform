module "k8s_lb_subnet" {
  source                         = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-subnet//module?ref=1.4.0"
  custom_name                    = "${var.application}-k8s_lb-sn-${var.environment}"
  landing_zone_slug              = var.landing_zone_slug
  location_short                 = module.regions.location_short
  resource_group_name            = var.vnet_rg_name
  virtual_network_name           = var.vnet_name
  stack                          = var.stack
  workload_info                  = "${var.application}-k8s-lb-${var.environment}"
  address_prefixes               = [var.k8s_lb_subnet_address_prefix_map["${var.environment}"]]
  network_security_group_enabled = true
  network_security_group_id      = module.k8s_lb_nsg.nsg_id
  depends_on = [ module.k8s_lb_nsg ]
}