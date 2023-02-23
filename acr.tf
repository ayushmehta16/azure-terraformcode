resource "azurerm_container_registry" "sampleacr" {
  name                = "${var.registry_name}"
  resource_group_name = "${var.env}-${var.resource_group_name}"
  location            = "${var.location}"
  sku                 = "Basic"
  depends_on = [
    azurerm_resource_group.appgroup
  ]
}