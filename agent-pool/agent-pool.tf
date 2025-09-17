resource "azuredevops_elastic_pool" "steerin-mod-pool" {
  name                   = var.agent-pool_name
  project_id             = var.project_id
  service_endpoint_id    = var.service_endpoint_id
  service_endpoint_scope = var.service_endpoint_scope
  desired_idle           = var.desired_idle
  max_capacity           = var.max_capacity
  time_to_live_minutes   = var.time_to_live_minutes
  recycle_after_each_use = var.recycle_after_each_use
  azure_resource_id      = module.runner_vmss.vmss_id
  auto_update = true
  depends_on = [module.runner_vmss]
}
