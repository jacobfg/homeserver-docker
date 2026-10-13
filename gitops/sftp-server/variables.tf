# These values belong in an encrypted variables file, never in source defaults.
# Resource instance keys still appear in Terraform plans/state; keep those private.
variable "accounts" {
  description = "Accounts keyed by existing username; key paths are relative to this module."
  type = map(object({
    home_dir         = string
    email            = string
    public_key_files = list(string)
    permissions      = optional(map(string), {})
    folders = optional(map(object({
      virtual_path = string
      permissions  = string
    })), {})
  }))
  validation {
    condition = alltrue(flatten([for account in var.accounts : [
      for key in keys(account.folders) : contains(keys(var.folders), key)
    ]]))
    error_message = "Every account folder assignment must reference a configured folder key."
  }
  validation {
    condition = alltrue([for account in var.accounts :
      length(distinct([for folder in account.folders : folder.virtual_path])) == length(account.folders)
    ])
    error_message = "Virtual paths must be unique within each account."
  }
  validation {
    condition = alltrue(flatten([for account in var.accounts : [
      for folder in account.folders : startswith(folder.virtual_path, "/") && folder.virtual_path != "/"
    ]]))
    error_message = "Virtual folder paths must be absolute and must not be the account root."
  }
  validation {
    condition = alltrue(flatten([for account in var.accounts : [
      for path in keys(account.permissions) : startswith(path, "/")
    ]]))
    error_message = "Account permission paths must be absolute."
  }
}

variable "admin" {
  description = "Existing OIDC administrator identity."
  type = object({
    username = string
    email    = string
  })
}

variable "folders" {
  description = "Shared local folders keyed by stable identity; mapped paths are inside the SFTPGo container."
  type = map(object({
    name        = string
    mapped_path = string
  }))
  default = {}
  validation {
    condition     = alltrue([for folder in var.folders : startswith(folder.mapped_path, "/")])
    error_message = "Mapped folder paths must be absolute paths visible to SFTPGo."
  }
  validation {
    condition     = length(distinct([for folder in var.folders : folder.name])) == length(var.folders)
    error_message = "Server-side folder names must be unique."
  }
}

variable "web_client_url" {
  description = "Full WebClient URL used in large-scan notifications."
  type        = string
}

variable "email_names" {
  description = "Existing server-side action and rule names; preserve these during migration."
  type = object({
    scan_action       = string
    scan_rule         = string
    large_scan_action = string
    large_scan_rule   = string
  })
}

variable "existing_imports" {
  description = "Existing IDs to adopt: users/folders keyed by resource key, and zero-or-one-element lists for singleton resources."
  type = object({
    users             = optional(map(string), {})
    folders           = optional(map(string), {})
    admin             = optional(list(string), [])
    scan_action       = optional(list(string), [])
    scan_rule         = optional(list(string), [])
    large_scan_action = optional(list(string), [])
    large_scan_rule   = optional(list(string), [])
  })
  default = {}
  validation {
    condition = (
      alltrue([for ids in [
        var.existing_imports.admin,
        var.existing_imports.scan_action,
        var.existing_imports.scan_rule,
        var.existing_imports.large_scan_action,
        var.existing_imports.large_scan_rule,
      ] : length(ids) <= 1]) &&
      alltrue([for username in keys(var.existing_imports.users) : contains(keys(var.accounts), username)]) &&
      alltrue([for key in keys(var.existing_imports.folders) : contains(keys(var.folders), key)])
    )
    error_message = "Import only configured account/folder keys and at most one ID for each singleton resource."
  }
}
