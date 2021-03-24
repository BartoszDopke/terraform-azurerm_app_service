locals {
  ip_list = jsondecode(file(var.ip_list_path))
  keys    = keys(local.ip_list)
}

resource "azurerm_app_service" "app_service" {
  name                    = var.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  app_service_plan_id     = var.app_service_plan_id
  client_affinity_enabled = var.client_affinity_enabled
  enabled                 = var.enabled
  https_only              = var.https_only
  client_cert_enabled     = var.client_cert_enabled

  app_settings = var.app_settings

  auth_settings {
    default_provider              = var.auth_default_provider
    enabled                       = var.auth_enabled
    issuer                        = var.auth_issuer
    runtime_version               = var.auth_runtime_version
    token_store_enabled           = var.auth_token_store_enabled
    token_refresh_extension_hours = var.token_refresh_extension_hours
    unauthenticated_client_action = var.auth_unauthenticated_client_action

    dynamic "active_directory" {
      for_each = var.ad_map
      content {
        allowed_audiences = active_directory.value.allowed_audiences
        client_id         = active_directory.value.client_id
        client_secret     = active_directory.value.client_secret
      }
    }
  }

  dynamic "identity" {
    for_each = var.app_type != null ? [1] : []
    content {
      type = var.app_type
    }
  }

  site_config {
    always_on                 = var.always_on
    app_command_line          = var.app_command_line
    default_documents         = var.default_documents
    dotnet_framework_version  = var.dotnet_framework_version
    use_32_bit_worker_process = var.use_32_bit_worker_process
    managed_pipeline_mode     = var.managed_pipeline_mode
    ftps_state                = var.ftps_state
    websockets_enabled        = var.websockets_enabled
    remote_debugging_enabled  = var.remote_debugging_enabled
    min_tls_version           = var.min_tls_version
    linux_fx_version          = var.linux_fx_version
    remote_debugging_version  = var.remote_debugging_version
    php_version               = var.php_version
    scm_type                  = var.scm_type
    health_check_path         = var.health_check_path

    cors {
      allowed_origins     = var.allowed_origins
      support_credentials = var.support_credentials
    }

    dynamic "ip_restriction" {
      for_each = local.ip_list
      content {
        name       = "iprestriction${index(local.keys, ip_restriction.key) + 1}"
        ip_address = ip_restriction.key
        priority   = 1000 + index(local.keys, ip_restriction.key)
      }
    }
  }

  tags = var.tags
}


### DIAGNOSTIC SETTINGS

data "azurerm_monitor_diagnostic_categories" "diagset" {
  resource_id = azurerm_app_service.app_service.id
}

locals {
  log_categories = (
    data.azurerm_monitor_diagnostic_categories.diagset.logs
  )
  metric_categories = (
    data.azurerm_monitor_diagnostic_categories.diagset.metrics
  )

  logs = {
    for category in local.log_categories : category => {
      enabled = var.enabled
    }
  }

  metrics = {
    for metric in local.metric_categories : metric => {
      enabled = var.enabled
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  depends_on = [azurerm_app_service.app_service]

  count                      = var.enable_diagnostics == true ? 1 : 0
  name                       = "${var.name}-DIAG-01"
  target_resource_id         = azurerm_app_service.app_service.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "log" {
    for_each = local.logs
    content {
      category = log.key
      enabled  = true
    }
  }

  dynamic "metric" {
    for_each = local.metrics
    content {
      category = metric.key
      enabled  = true
    }
  }
}
