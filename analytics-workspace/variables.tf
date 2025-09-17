variable "domain_name_label" {
  default = "steerin"
  type    = string
}

variable "retention_in_days" {
  default = 30
  type    = number
}

variable "log_analytics_sku" {
  default =  "PerGB2018"
  type    = string
}

variable "component" {
  description = "component of the application for which the analytics workspace will be used for"
  type        = string
  default     = ""
}