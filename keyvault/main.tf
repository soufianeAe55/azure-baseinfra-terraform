locals {
  component_append         = (var.component == "") ? "" : "-${var.component}"
  keyvault_rg_name         = var.use_new_rg_for_kv ? "${var.application}${local.component_append}-kv-rg-${var.environment}" : var.existing_rg_name_for_kv
  keyvault_custom_name_raw = "${var.application}${local.component_append}-kv-${var.environment}"
  // azure KV names may only contain alphanumeric characters and dashes and must be between 3-24 chars
  keyvault_custom_name = length(local.keyvault_custom_name_raw) >= 24 ? "${var.component}-kv-${var.environment}" : local.keyvault_custom_name_raw

  domain_name = "${var.component}.privatelink.vaultcore.azure.net"

  dev_service_principal_id = "93138a0b-76bf-4547-950e-f0ae327ed340"

  purge_protection_enabled_per_env = {
    "prod"      = true
    "devstg"    = true
    "baseinfra" = true
    "lab"       = false
  }

  soft_delete_retention_days_per_env = {
    "prod"      = 90
    "devstg"    = 90
    "baseinfra" = 90
    "lab"       = 7
  }
}


