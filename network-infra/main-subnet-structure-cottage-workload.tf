locals {

  cottage_prod_subnet_address_range_start_digit = 40
  cottage_prod_subnet_address_range_stop_digit = 49
  // declaring the prefixes below do not trigger any subnet creation
  cottages_prod = {
    "pitch-booster" = {
      "type" = "project" // type (project or sandbox)
      "subnet_address_prefix" = "${var.vnet_classA_address_network_portion}.40.0/24"
    },
    "ods-server" = {
      "type" = "project" // type (project or sandbox)
      "subnet_address_prefix" = "${var.vnet_classA_address_network_portion}.41.0/28" // Mask of /28 -> 16 IPs: .41.0 ... .41.15
    },
    "pitch-booster-2" = {
      "type" = "project" // type (project or sandbox)
      "subnet_address_prefix" = "${var.vnet_classA_address_network_portion}.41.16/28" // Mask of /28 -> 16 IPs: .41.16 ... .41.31
    }
  }

  cottage_devstg_subnet_address_range_start_digit = 140
  cottage_devstg_subnet_address_range_stop_digit = 149
  cottages_devstg = {
    "internal-team-env" = {
      "type" = "sandbox"
      "subnet_address_prefix" = "${var.vnet_classA_address_network_portion}.140.0/24"
    },
    "internal-team-env-2" = {
      "type" = "sandbox"
      "subnet_address_prefix" = "${var.vnet_classA_address_network_portion}.141.0/24"
    }
  }

  cottage_lab_subnet_address_range_start_digit = 212
  cottage_lab_subnet_address_range_stop_digit = 213
  cottages_lab = {}
  
}

