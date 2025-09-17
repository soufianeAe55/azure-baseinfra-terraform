variable "role_assignments" {
  description = <<EOT
A list of objects representing Azure RBAC role assignments. Each object must include:
- principal_id: The Azure AD object ID of the principal (User, Group, or Service Principal) to assign the role to.
- scope: The scope at which the role assignment applies (e.g. a subscription, resource group, or resource ID).
- principal_type: The type of the principal; one of 'User', 'Group', or 'ServicePrincipal'.
- Exactly one of the following:
  * role: The name of a built-in Azure role to assign (e.g. 'Reader', 'Contributor').
  * role_definition_id: The resource ID of a custom role definition.
EOT
  type = list(object({
    principal_id       = string
    role               = optional(string, "")
    role_definition_id = optional(string, "")
    scope              = string
    principal_type     = string
  }))

  validation {
    condition = alltrue([
      for ra in var.role_assignments : (
        contains(["ServicePrincipal", "User", "Group"], ra.principal_type) &&
        (
          (
            length(ra.role) > 0 ? 1 : 0
          ) +
          (
            length(ra.role_definition_id) > 0 ? 1 : 0
          )
        ) == 1
      )
    ])
    error_message = <<EOT
Each role assignment must specify a valid principal_type ('ServicePrincipal', 'User', 'Group'),
and exactly one of 'role' (built-in role name) or 'role_definition_id' (custom role ID).
EOT
  }
}
