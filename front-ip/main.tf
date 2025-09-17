locals {
  project_name = var.project_name
  component_append = (var.component == "") ? "" : "-${var.component}"
  public_ip_rg_name = "${var.application}${local.component_append}-public_ip-rg-${var.environment}"
  public_ip_custom_name = "${var.application}${local.component_append}-public_ip-${var.environment}"
}