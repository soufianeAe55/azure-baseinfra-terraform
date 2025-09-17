variable "vmss_subnet_creation_enabled" {
  type = bool
  default = false
  description = "specify if the vmss subnet should be created or not, true if you want it to be created."
}

variable "vnet_name" {
  type        = string
  description = "vnet name. specify the vnet name. if you chose to create a subnet for the vmss with the variable : vmss_subnet_creation_enabled : true."
  default = null
}

variable "vnet_rg_name" {
  type        = string
  description = "vnet resource group name. specify the vnet rg name if you chose to create a subnet for the vmss with the variable : vmss_subnet_creation_enabled : true."
  default = null
}

variable "vmss_subnet_name" {
  type        = string
  description = "virtual machine scale set subnet name. specify the vmss subnet name if you chose to create a subnet for the vmss with the variable : vmss_subnet_creation_enabled : true."
  default     = null
}

variable "vmss_subnet_address_prefix" {
  type = string
  default = null
  description = "provide a subnet prefix ex (10.1.1.0/24). if you chose to create a subnet for the vmss with the variable : vmss_subnet_creation_enabled : true."
}

variable "vmss_subnet_id" {
  type        = string
  description = "vmss subnet id. specify the subnet id. if you chose to use an existing subnet for the vmss with the variable : vmss_subnet_creation_enabled : false."
  default     = null
}

variable "vmss_asg_id" {
  type        = string
  description = "the virtual machine scale set instances's application security group ids."
  default     = null
}