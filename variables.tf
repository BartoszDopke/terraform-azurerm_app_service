#REQUIRED

variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "app_service_plan_id" {
  type = string
}

variable "client_affinity_enabled" {
  type    = bool
  default = null
}

variable "enabled" {
  type    = bool
  default = null
}

variable "https_only" {
  type    = bool
  default = null
}

variable "client_cert_enabled" {
  type    = bool
  default = false
}

variable "app_settings" {
  type    = map(string)
  default = null
}

#auth_settings

variable "auth_default_provider" {
  type    = string
  default = null
}

variable "auth_enabled" {
  type = string
}

variable "auth_issuer" {
  type    = string
  default = null
}

variable "auth_runtime_version" {
  type    = string
  default = null
}

variable "auth_token_store_enabled" {
  type    = string
  default = false
}

variable "token_refresh_extension_hours" {
  type    = number
  default = 72
}

variable "auth_unauthenticated_client_action" {
  type    = string
  default = null
}

variable "ad_map" {
  type    = map(any)
  default = {}
}

#identity
variable "app_type" {
  type        = string
  default     = null
  description = "Enable or disable MSI"
}

#site_config

variable "always_on" {
  type    = bool
  default = false
}

variable "app_command_line" {
  type    = string
  default = null
}

variable "default_documents" {
  type    = list(string)
  default = []
}

variable "dotnet_framework_version" {
  type    = string
  default = "v4.0"
}

variable "use_32_bit_worker_process" {
  type    = bool
  default = null
}

variable "managed_pipeline_mode" {
  type    = string
  default = "Integrated"
}

variable "ftps_state" {
  type    = string
  default = null
}

variable "websockets_enabled" {
  type    = bool
  default = null
}

variable "remote_debugging_enabled" {
  type    = bool
  default = false
}

variable "min_tls_version" {
  type    = string
  default = "1.2"
}

variable "linux_fx_version" {
  type    = string
  default = null
}

variable "allowed_origins" {
  type    = list(string)
  default = []
}

variable "support_credentials" {
  type    = bool
  default = null
}

variable "remote_debugging_version" {
  type    = string
  default = null
}

variable "php_version" {
  type    = string
  default = null
}

variable "scm_type" {
  type    = string
  default = null
}

variable "ip_list_path" {
  type        = string
  default     = null
  description = "IP list path for IP restrictions"
}

variable "health_check_path" {
  type    = string
  default = null
}

#tags
variable "tags" {
  type        = map(any)
  description = "Map of tags"
}


###DIAGNOSTIC SETTINGS

#REQUIRED

variable "log_analytics_workspace_id" {
  type        = string
  default     = null
  description = "Workspace ID"
}

variable "enable_diagnostics" {
  type    = bool
  default = false
}
