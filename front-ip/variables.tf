variable "skip_ip_creation" {
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  type        = string
}

variable "domain_name_label" {
  default = null
  type    = string
}

variable "component" {
  type = string
  default = ""
  description = "component using the public ip"
}