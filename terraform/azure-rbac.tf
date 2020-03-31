data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "sp-aks" {
}

resource "azurerm_role_assignment" "sp-aks-network" {
    scope                   = "${azurerm_virtual_network.demo.id}"
    role_definition_name    = "Network Contributor"
    principal_id            = "${azuread_service_principal.sp-aks.object_id}"
}

resource "azurerm_role_assignment" "sp-aks" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = "${azuread_service_principal.sp-aks.id}"
}
