locals {
  project_name          = var.project_name
  component_append      = (var.component == "") ? "" : "-${var.component}"
  observability_rg_name = "${var.application}${local.component_append}-observability-rg-${var.environment}"

  log_analytics_table_plans_per_env = {
    baseinfra = [
      { table_name = "AzureMetrics", plan = "Basic" },
      { table_name = "AKSAudit", plan = "Basic" },
      { table_name = "AKSAuditAdmin", plan = "Basic" },
      { table_name = "AKSControlPlane", plan = "Basic" }
    ],
    lab = [
      { table_name = "AzureMetrics", plan = "Basic" },
      { table_name = "AKSAudit", plan = "Basic" },
      { table_name = "AKSAuditAdmin", plan = "Basic" },
      { table_name = "AKSControlPlane", plan = "Basic" }
    ],
    dev = [
      { table_name = "AzureMetrics", plan = "Basic" },
      { table_name = "AKSAudit", plan = "Basic" },
      { table_name = "AKSAuditAdmin", plan = "Basic" },
      { table_name = "AKSControlPlane", plan = "Basic" }
    ],
    devstg = [
      { table_name = "AzureMetrics", plan = "Basic" },
      { table_name = "AKSAudit", plan = "Basic" },
      { table_name = "AKSAuditAdmin", plan = "Basic" },
      { table_name = "AKSControlPlane", plan = "Basic" }
    ],
    prod = [
      { table_name = "AzureMetrics", plan = "Basic" },
      { table_name = "AKSAudit", plan = "Basic" },
      { table_name = "AKSAuditAdmin", plan = "Basic" },
      { table_name = "AKSControlPlane", plan = "Basic" }
    ]
  }
}