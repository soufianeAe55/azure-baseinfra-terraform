// DO NOT MODIFY THIS FILE IT IS DUPLICATED ACCROSS ALL COMMON/GENERIC MODULES, OR MODIFY ALL OF THEM AT ONCE

variable "application" {
  type        = string
}

variable "location" {
  type        = string
}

variable "owner" {
  type        = string
}

variable "stack" {
  type        = string
}

variable "project_name" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "spoc" {
  type        = string
}

variable "cost_center" {
  type        = string
}

variable "change" {
  type        = string
}

variable "tlp_colour" {
  type        = string
  validation {
    condition     = contains(["RED", "AMBER", "GREEN", "WHITE"], var.tlp_colour)
    error_message = "Invalid variable: ${var.tlp_colour}. The valid TLP colours are RED, AMBER, GREEN, WHITE"
  }
}

variable "cia_rating" {
  type        = string
}

variable "technical_owner" {
  type        = string
}

variable "landing_zone_slug" {
  type        = string
}

variable "sku" {
  type        = string
}

variable "ado_repo" {
  type        = string
  validation {
    condition     = length(var.ado_repo) >= 4 && can(regex("^.+/.+$", var.ado_repo))
    error_message = "The 'ado_repo' variable must contain a slash and be at least 4 characters long. The format should be 'project_name/repo_name'."
  }
}


