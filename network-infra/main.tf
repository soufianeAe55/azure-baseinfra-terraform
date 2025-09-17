locals {
  
  project_name = var.project_name
  vnet_name = "${var.application}-vnet-${var.environment}"
  virtual_network_rg_name = "${var.application}-network-base-rg-${var.environment}"
  network_microseg_rg_name = "${var.application}-network-microseg-rg-${var.environment}"
  private_dns_zone_rg_name = "${var.application}-private-dns-zone-rg-${var.environment}"
  keyvault_private_dns_zone_name = "privatelink.vaultcore.azure.net" // Recommended by Azure
  steerin_private_dns_zone_name = "steerin.io"
  network_prefix = var.vnet_classA_address_network_portion

}


