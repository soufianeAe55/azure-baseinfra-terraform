output "keyvault_id" {
  description = "keyvault ID"
  value       = module.keyvault.kv_id
}

output "keyvault_uri" {
  description = "keyvault URI"
  value       = module.keyvault.kv_vault_uri
}

