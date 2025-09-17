locals {
  keyvault_prod_subnet_address_digit = 39
  keyvault_prod_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.keyvault_prod_subnet_address_digit}.0/24"

  keyvault_devstg_subnet_address_digit = 139
  keyvault_devstg_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.keyvault_devstg_subnet_address_digit}.0/24"

  keyvault_lab_subnet_address_digit = 214
  keyvault_lab_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.keyvault_lab_subnet_address_digit}.0/24"

  keyvault_base_infra_subnet_address_digit = 249
  keyvault_base_infra_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.keyvault_base_infra_subnet_address_digit}.0/24"
}