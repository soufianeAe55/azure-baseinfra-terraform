variable "component" {
  description = "component of the application for which the vault will be used for"
  type        = string
  default     = ""
}

variable "use_new_rg_for_kv" {
  description = "shall the module create a new dedicated resource group for this kv ?"
  type        = bool
  default     = true
}

variable "existing_rg_name_for_kv" {
  description = "optional: name of the existing rg to put this kv in"
  type        = string
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "workspace analytics where Key Vault will redirect analytics to"
  type = string
}

variable "keyvault_private_dns_zone_id" {
  type = string
  description = "keyvault private dns zone id"
}

variable "private_endpoint_subnet_id" {
  type = string
  description = "key vault private endpoint subnet id"
}

variable "private_endpoint_asg_id" {
  type = string
  description = "ID of the ASG associated with key vault private endpoint"
}