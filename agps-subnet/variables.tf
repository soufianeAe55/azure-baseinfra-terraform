variable "log_analytics_workspace_id" {
  type = string
}

variable "vnet_name" {
  type        = string
  description = "vnet name"
}

variable "vnet_rg_name" {
  type        = string
  description = "vnet resource group name"
}

variable "network_microseg_resource_group_name" {
  type        = string
  description = "Network microseg resource group name"
}