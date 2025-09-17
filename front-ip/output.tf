output "front_ip_id" {
  description = "public ip id"
  value       = var.skip_ip_creation ? null : module.pip[0].public_ip_id
}