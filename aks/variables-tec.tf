// DO NOT MODIFY THIS FILE IT IS DUPLICATED ACCROSS ALL COMMON/GENERIC MODULES, OR MODIFY ALL OF THEM AT ONCE
# terraform-docs-ignore
variable "application" {
  type        = string
}
# terraform-docs-ignore
variable "location" {
  type        = string
}
# terraform-docs-ignore
variable "owner" {
  type        = string
}
# terraform-docs-ignore
variable "stack" {
  type        = string
}
# terraform-docs-ignore
variable "project_name" {
  type        = string
}
# terraform-docs-ignore
variable "environment" {
  type        = string
}
# terraform-docs-ignore
variable "spoc" {
  type        = string
}
# terraform-docs-ignore
variable "cost_center" {
  type        = string
}
# terraform-docs-ignore
variable "change" {
  type        = string
}
# terraform-docs-ignore
variable "tlp_colour" {
  type        = string
  validation {
    condition     = contains(["RED", "AMBER", "GREEN", "WHITE"], var.tlp_colour)
    error_message = "Invalid variable: ${var.tlp_colour}. The valid TLP colours are RED, AMBER, GREEN, WHITE"
  }
}
# terraform-docs-ignore
variable "cia_rating" {
  type        = string
}
# terraform-docs-ignore
variable "technical_owner" {
  type        = string
}
# terraform-docs-ignore
variable "landing_zone_slug" {
  type        = string
}
# terraform-docs-ignore
variable "sku" {
  type        = string
}
# terraform-docs-ignore
variable "ado_repo" {
  type        = string
  validation {
    condition     = length(var.ado_repo) >= 4 && can(regex("^.+/.+$", var.ado_repo))
    error_message = "The 'ado_repo' variable must contain a slash and be at least 4 characters long. The format should be 'project_name/repo_name'."
  }
}


