variable "service_endpoint_id" {
  type        = string
  description = "service endpoint ID."

}
variable "service_endpoint_scope" {
  type        = string
  description = "service endpoint scope."
}

variable "project_id" {
  type        = string
  description = "project id."
}

variable "personal_access_token" {
  type        = string
  description = "personal access token."
}

variable "organization_url" {
  type        = string
  description = "organization url."
}

variable "agent-pool_name" {
  type        = string
  description = "agent pool name."
}

variable "log_analytics_workspace_id" {
  type = string
  description = "log analytics workspace id."
}

variable "vmss_source_image_id" {
  type = string
  description = "the vmss source image id."
}

variable "desired_idle" {
  type = number
  default = 1
  description = "Number of agents to keep on standby."
}
variable "max_capacity" {
  type = number
  default = 2
  description = "Maximum number of virtual machines in the scale set."
}
variable "time_to_live_minutes" {
  type = number
  default = 15
  description = "the time after which the idle agents will be shutdown."
}
variable "recycle_after_each_use" {
  type = bool
  default = false
  description = "specify if you want to shutdown the agent after each use"
}