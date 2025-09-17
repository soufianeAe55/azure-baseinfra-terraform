resource "azurerm_log_analytics_workspace_table" "log_analytics_table_config" {
  for_each = { for plan in local.log_analytics_table_plans_per_env[var.environment] : plan.table_name => plan }

  name                    = each.value.table_name
  workspace_id            = module.log_analytics_workspace.log_analytics_workspace_id
  plan                    = each.value.plan
  total_retention_in_days = 30
}
