# Creating a resource group

resource "azurerm_resource_group" "appgroup" {
  name     = "${var.env}-${var.resource_group_name}"
  location = "${var.location}"
}