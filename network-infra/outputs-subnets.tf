output bastion_subnet_address_prefix {
  description = "bastion subnet address prefix"
  value       = "${local.bastion_subnet_address_prefix}"
}

output gateway_subnet_address_prefix {
  description = "gateway subnet address prefix"
  value       = "${local.gateway_subnet_address_prefix}"
}

output jump_vm_subnet_address_prefix {
  description = "jump vm subnet address prefix"
  value       = "${local.jump_vm_subnet_address_prefix}"
}

output cicd_subnet_address_prefix {
  description = "cicd subnet address prefix"
  value       = "${local.cicd_subnet_address_prefix}"
}

output agps_subnet_address_prefix {
  description = "agps subnet address prefix"
  value       = "${local.agps_subnet_address_prefix}"
}