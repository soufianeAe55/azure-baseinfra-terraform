resource "azurerm_network_security_rule" "Internal_K8S_LB_All_Allow" {
  name                         = "Internal_K8S_LB_All_Allow-${var.environment}"
  priority                     = 100
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_address_prefixes      = [var.k8s_lb_subnet_address_prefix_map["${var.environment}"]]
  destination_address_prefixes = [var.k8s_lb_subnet_address_prefix_map["${var.environment}"]]
  resource_group_name          = var.network_microseg_resource_group_name
  network_security_group_name  = module.k8s_lb_nsg.nsg_name

  depends_on = [ module.k8s_lb_nsg ]
}

resource "azurerm_network_security_rule" "AppGTW_to_K8S_LB_Allow" {
  name                         = "AppGTW_to_K8S_LB_Allow-${var.environment}"
  priority                     = 200
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = "80"
  source_address_prefixes      = [var.gateway_subnet_address_prefix]
  destination_port_range       = "80"
  destination_address_prefixes = [var.k8s_lb_subnet_address_prefix_map["${var.environment}"]]
  resource_group_name          = var.network_microseg_resource_group_name
  network_security_group_name  = module.k8s_lb_nsg.nsg_name

  depends_on = [ module.k8s_lb_nsg ]
}
resource "azurerm_network_security_rule" "Jumpvm_to_K8S_LB_Allow" {
  name                         = "Jumpvm_to_K8S_LB_Allow-${var.environment}"
  priority                     = 199
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = "80"
  source_address_prefixes      = [var.jump_vm_subnet_address_prefix]
  destination_port_range       = "80"
  destination_address_prefixes = [var.k8s_lb_subnet_address_prefix_map["${var.environment}"]]
  resource_group_name          = var.network_microseg_resource_group_name
  network_security_group_name  = module.k8s_lb_nsg.nsg_name

  depends_on = [ module.k8s_lb_nsg ]
}

resource "azurerm_network_security_rule" "Unknown_To_K8S_LB_All_Deny" {
  name                         = "Unknown_To_K8S_LB_All_Deny-${var.environment}"
  priority                     = 4000
  direction                    = "Inbound"
  access                       = "Deny"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_address_prefix        = "*"
  destination_address_prefixes = [var.k8s_lb_subnet_address_prefix_map["${var.environment}"]]
  resource_group_name          = var.network_microseg_resource_group_name
  network_security_group_name  = module.k8s_lb_nsg.nsg_name

  depends_on = [ module.k8s_lb_nsg ]
}