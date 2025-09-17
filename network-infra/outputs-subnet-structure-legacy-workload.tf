output "legacy_subnet_address_range_start_digits_map" {
  description = "start digit the the subnet address range dedicated for legacy workloads, by environment"
  value = {
    "lab": local.legacy_lab_subnet_address_range_start_digit
    "devstg": local.legacy_devstg_subnet_address_range_start_digit
    "prod": local.legacy_prod_subnet_address_range_start_digit
  }
}

output "legacy_subnet_address_range_stop_digits_map" {
  description = "stop digit the the subnet address range dedicated for legacy workloads, by environment"
  value = {
    "lab": local.legacy_lab_subnet_address_range_stop_digit
    "devstg": local.legacy_devstg_subnet_address_range_stop_digit
    "prod": local.legacy_prod_subnet_address_range_stop_digit
  }
}

output "legacy_subnet_address_prefixes_map" {
  description = "the subnet address prefixes dedicated for legacy workloads, by environment"
  value = {
    "lab": [for index in range(local.legacy_lab_subnet_address_range_start_digit, local.legacy_lab_subnet_address_range_stop_digit + 1, 1): "${local.network_prefix}.${index}.0/24"]
    "devstg": [for index in range(local.legacy_devstg_subnet_address_range_start_digit, local.legacy_devstg_subnet_address_range_stop_digit + 1, 1): "${local.network_prefix}.${index}.0/24"]
    "prod": [for index in range(local.legacy_prod_subnet_address_range_start_digit, local.legacy_prod_subnet_address_range_stop_digit + 1, 1): "${local.network_prefix}.${index}.0/24"]
  }
}