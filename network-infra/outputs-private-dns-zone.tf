output "keyvault_private_dns_zone_id" {
  description = "the DNS id of the private keyvault DNS zone"
  value = module.keyvault_private_dns_zone.id
}

output "steerin_private_dns_zone_id" {
  description = "the DNS id of the steerin DNS zone"
  value = module.steerin_private_dns_zone.id
}