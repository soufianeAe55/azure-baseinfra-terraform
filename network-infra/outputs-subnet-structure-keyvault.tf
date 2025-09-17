output "keyvault_subnet_address_prefix_map" {
  description = "subnet address prefixes for keyvaults, by environment"
  value = {
    "baseinfra": local.keyvault_base_infra_subnet_address_prefix
    "lab": local.keyvault_lab_subnet_address_prefix
    "devstg": local.keyvault_devstg_subnet_address_prefix
    "prod": local.keyvault_prod_subnet_address_prefix
  }
}