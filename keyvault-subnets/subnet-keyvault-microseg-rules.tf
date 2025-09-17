// commun (baseinfra, lab, devstg, prod)-subnet-keyvault ALLOW rules
resource "azurerm_network_security_rule" "Agp_To_subnet_Keyvault_Allow" {
  for_each = var.agp_asg_ids_map

  name                                  = "Agp_To_subnet_Keyvault_Allow-${each.key}"
  priority                              = 100
  direction                             = "Inbound"
  access                                = "Allow"
  protocol                              = "*"
  source_port_range                     = "*"
  destination_port_range                = "*"
  source_application_security_group_ids = [each.value]
  destination_address_prefix            = var.keyvault_subnet_address_prefix_map["${each.key}"]
  resource_group_name                   = var.network_microseg_resource_group_name
  network_security_group_name           = module.keyvault_nsg["${each.key}"].nsg_name

  depends_on = [module.keyvault_nsg]
}

// baseinfra-subnet-keyvault custom ALLOW rules
resource "azurerm_network_security_rule" "Gateway_To_baseinfra_subnet_Keyvault_Allow" {

  name                        = "Gateway_To_baseinfra_subnet_Keyvault_Allow"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.gateway_subnet_address_prefix
  destination_address_prefix  = var.keyvault_subnet_address_prefix_map["baseinfra"]
  resource_group_name         = var.network_microseg_resource_group_name
  network_security_group_name = module.keyvault_nsg["baseinfra"].nsg_name

  depends_on = [module.keyvault_nsg]
}
resource "azurerm_network_security_rule" "aks_devstg_To_baseinfra_subnet_Keyvault_Allow" {

name                        = "aks_devstg_To_baseinfra_subnet_Keyvault_Allow"
priority                    = 111
direction                   = "Inbound"
access                      = "Allow"
protocol                    = "*"
source_port_range           = "*"
destination_port_range      = "*"
source_address_prefixes       = [var.k8s_workload_subnet_address_prefixes_map["devstg"][0]]
destination_address_prefix  = var.keyvault_subnet_address_prefix_map["baseinfra"]
resource_group_name         = var.network_microseg_resource_group_name
network_security_group_name = module.keyvault_nsg["baseinfra"].nsg_name

depends_on = [module.keyvault_nsg]
}
// lab-subnet-keyvault custom ALLOW rules

// devstg-subnet-keyvault custom ALLOW rules

// prod-subnet-keyvault custom ALLOW rules

// lab-subnet-keyvault custom DENY rules

// devstg-subnet-keyvault custom DENY rules

// prod-subnet-keyvault custom DENY rules

// commun (baseinfra, lab, devstg, prod)-subnet-keyvault DENY rules
resource "azurerm_network_security_rule" "Unknown_To_subnet_Keyvault_All_Deny" {
  for_each = var.keyvault_subnet_address_prefix_map

  name                        = "Unknown_To_subnet_Keyvault_All_Deny-${each.key}"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = each.value
  resource_group_name         = var.network_microseg_resource_group_name
  network_security_group_name = module.keyvault_nsg["${each.key}"].nsg_name

  depends_on = [module.keyvault_nsg]
}