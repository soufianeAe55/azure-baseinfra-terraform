locals {

  k8s_lb_prod_subnet_address_digit  = 0
  k8s_lb_prod_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.k8s_lb_prod_subnet_address_digit}.0/24"

  k8s_workload_prod_subnet_address_range_start_digit = 1
  k8s_workload_prod_subnets_to_create = 1
  k8s_workload_prod_subnet_address_range_stop_digit = 38
  k8s_workload_prod_subnet_address_prefixes = [for index in range(local.k8s_workload_prod_subnet_address_range_start_digit, local.k8s_workload_prod_subnet_address_range_start_digit + local.k8s_workload_prod_subnets_to_create, 1): "${var.vnet_classA_address_network_portion}.${index}.0/24"]

  k8s_lb_devstg_subnet_address_digit  = 100
  k8s_lb_devstg_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.k8s_lb_devstg_subnet_address_digit}.0/24"

  k8s_workload_devstg_subnet_address_range_start_digit = 101
  k8s_workload_devstg_subnets_to_create = 1
  k8s_workload_devstg_subnet_address_range_stop_digit = 138
  k8s_workload_devstg_subnet_address_prefixes = [for index in range(local.k8s_workload_devstg_subnet_address_range_start_digit, local.k8s_workload_devstg_subnet_address_range_start_digit + local.k8s_workload_devstg_subnets_to_create, 1): "${var.vnet_classA_address_network_portion}.${index}.0/24"]

  k8s_lb_lab_subnet_address_digit  = 200
  k8s_lb_lab_subnet_address_prefix = "${var.vnet_classA_address_network_portion}.${local.k8s_lb_lab_subnet_address_digit}.0/24"

  k8s_workload_lab_subnet_address_range_start_digit = 201
  k8s_workload_lab_subnets_to_create = 1
  k8s_workload_lab_subnet_address_range_stop_digit = 209
  k8s_workload_lab_subnet_address_prefixes = [for index in range(local.k8s_workload_lab_subnet_address_range_start_digit, local.k8s_workload_lab_subnet_address_range_start_digit + local.k8s_workload_lab_subnets_to_create, 1): "${var.vnet_classA_address_network_portion}.${index}.0/24"]
  
}

