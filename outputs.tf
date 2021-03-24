output "name" {
  value = azurerm_app_service.app_service.name
}

output "id" {
  value = azurerm_app_service.app_service.id
}

output "default_site_hostname" {
  value = azurerm_app_service.app_service.default_site_hostname
}

output "principal_id" {
  value = azurerm_app_service.app_service.identity.0.principal_id
}