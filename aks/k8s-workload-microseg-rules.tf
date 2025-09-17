resource "azurerm_network_security_rule" "Internal_K8S_Workload_All_Allow" {
  name                         = "Internal_K8S_Workload_All_Allow-${var.environment}"
  priority                     = 100
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_address_prefixes      = [var.k8s_workload_subnet_address_prefixes_map["${var.environment}"][0]]
  destination_address_prefixes = [var.k8s_workload_subnet_address_prefixes_map["${var.environment}"][0]]
  resource_group_name          = var.network_microseg_resource_group_name
  network_security_group_name  = module.k8s_workload_nsg.nsg_name

  depends_on = [ module.k8s_workload_nsg ]
}

resource "azurerm_network_security_rule" "Agp_to_K8S_Workload_Allow" {
  name                         = "Agp_to_K8S_Workload_Allow-${var.environment}"
  priority                     = 110
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_application_security_group_ids = [var.agp_asg_ids_map["${var.environment}"]]
  destination_address_prefixes = [var.k8s_workload_subnet_address_prefixes_map["${var.environment}"][0]] //TODO maybe switch to aks private link endpoint ?
  resource_group_name          = var.network_microseg_resource_group_name
  network_security_group_name  = module.k8s_workload_nsg.nsg_name

  depends_on = [ module.k8s_workload_nsg ]
}


resource "azurerm_network_security_rule" "allow_azure_load_balancer_inbound" {
  name                        = "AllowAzureLoadBalancerInBound"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefixes  = [var.k8s_workload_subnet_address_prefixes_map["${var.environment}"][0]]
  resource_group_name         = var.network_microseg_resource_group_name
  network_security_group_name = module.k8s_workload_nsg.nsg_name
  description                 = "Allow inbound traffic from azure load balancer"
}

resource "azurerm_network_security_rule" "JUMP_VM_To_K8S_Workload_Allow" {
  name                         = "JUMP_VM_To_K8S_Workload_Allow-${var.environment}"
  priority                     = 300
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_address_prefix        = var.jump_vm_subnet_address_prefix
  destination_address_prefixes = [var.k8s_workload_subnet_address_prefixes_map["${var.environment}"][0]]
  resource_group_name          = var.network_microseg_resource_group_name
  network_security_group_name  = module.k8s_workload_nsg.nsg_name

  depends_on = [ module.k8s_workload_nsg ]
}


resource "azurerm_network_security_rule" "Unknown_To_K8S_Workload_All_Deny" {
  name                         = "Unknown_To_K8S_Workload_All_Deny-${var.environment}"
  priority                     = 4000
  direction                    = "Inbound"
  access                       = "Deny"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_address_prefix        = "*"
  destination_address_prefixes = [var.k8s_workload_subnet_address_prefixes_map["${var.environment}"][0]]
  resource_group_name          = var.network_microseg_resource_group_name
  network_security_group_name  = module.k8s_workload_nsg.nsg_name

  depends_on = [ module.k8s_workload_nsg ]
}