variable "log_analytics_workspace_id" {
  type        = string
}

variable "vnet_classA_address_network_portion" {
  type        = string
  description = "the network identifier of the vnet of the class A network (ex:10.0)"
}