locals {

  // Dedicated subnet for all agent pool instances (baseinfra, lab, devstg, prod) 
  agps_subnet_address_digit = 248
  agps_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.agps_subnet_address_digit}.0/24"

  // digit 249 is taken for base infra keyvault subnet

  jump_vm_subnet_address_digit = 250
  jump_vm_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.jump_vm_subnet_address_digit}.0/24"

  cicd_subnet_address_digit = 251
  cicd_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.cicd_subnet_address_digit}.0/24"

  bastion_subnet_address_digit = 252
  bastion_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.bastion_subnet_address_digit}.0/24"

  gateway_subnet_address_digit = 253
  gateway_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.gateway_subnet_address_digit}.0/24"

}