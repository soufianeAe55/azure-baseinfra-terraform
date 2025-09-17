variable "log_analytics_workspace_id" {
  type        = string
  description = "log analytics workspace id."
}

variable "ingress_application_gateway_id" {
  type        = string
  default = null
  description = "AGIC application gateway ingress controller id, if you want to use agic."
}

variable "k8s_version" {
  type        = string
  default     = "1.28.5" //current version of existing cluster as of Sep 2024
  description = "k8s version."
}

variable "k8s_application_security_group_id" {
  type        = string
  description = "k8s application security group id."
}

variable "system_node_pool_agent_min_count" {
  type        = number
  default     = 1
  description = "the min count of agents for the system node pool."
}

variable "system_node_pool_agent_max_count" {
  type        = number
  default     = 2
  description = "the max count of agents for the system node pool."
}

variable "system_node_pool_agent_size" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "the system node pool's size."
}

variable "user_nodepool_vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "the user node pool's size."
}

variable "user_nodepool_initial_node_count" {
  type        = number
  default     = 3
  description = "the initial count of agents for the user node pool, must be between min & max count."
}

variable "user_nodepool_node_min_count" {
  type        = number
  default     = 1
  description = "the min count of agents for the user node pool."
}

variable "user_nodepool_node_max_count" {
  type        = number
  default     = 15
  description = "the max count of agents for the user node pool."
}

variable "user_nodepool_agent_max_pods" {
  type        = number
  default     = 50
  description = "the max number of pods per user node pool."
}

variable "user_nodepool_os_disk_size_gb" {
  type        = number
  default     = 50
  description = "the user node pool's os disk size."
}

variable "network_microseg_resource_group_name" {
  type = string
  description = "Network microseg resource group name."
}

variable "jump_vm_subnet_address_prefix" {
  type = string
  description = "IP space range for the jump vm subnet."
}

variable "gateway_subnet_address_prefix" {
  type = string
  description = "Application Gateway subnet prefix."
}

variable "vnet_id" {
  type = string
  description = "vnet ID."
}

variable "vnet_name" {
  type = string
  description = "vnet name."
}

variable "vnet_rg_name" {
  type = string
  description = "vnet resource group name."
}

variable "agp_asg_ids_map" {
  description = "agent_pool asg map ids."
  type = object({
    lab = string
    devstg = string
    prod = string
  })
}

variable "aks_uid_id" {
  description = "aks user-assigned identity ID."
  type = string
}

variable "kubelet_identity" {
  description = "The kubelet identity for the AKS cluster."
  type = object({
    client_id                 = string
    object_id                 = string
    user_assigned_identity_id = string
  })
}

variable "workload_identity_enabled" {
  description = "Specifies whether Azure AD Workload Identity should be enabled for the Cluster"
  type        = bool
  default     = false
}