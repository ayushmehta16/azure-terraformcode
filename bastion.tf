resource "azurerm_subnet" "appgroupbastionsubnet" {
  name                 = "${var.bastion_name}"
  resource_group_name  = "${var.env}-${var.resource_group_name}"
  virtual_network_name = "${var.vnetname}"
  address_prefixes     = "${var.address_prefixes}"
  depends_on = [
    azurerm_virtual_network.demovnet01
  ]
}

resource "azurerm_public_ip" "appgroupbastionip" {
  name                = "${var.bastion_ip_name}"
  resource_group_name = "${var.env}-${var.resource_group_name}"
  location            = "${var.location}"
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [
    azurerm_resource_group.appgroup
  ]
}

resource "azurerm_bastion_host" "appgroupbastion" {
  name                = "${var.bastion-name}"
  location            = "${var.location}"
  resource_group_name = "${var.env}-${var.resource_group_name}"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.appgroupbastionsubnet.id
    public_ip_address_id = azurerm_public_ip.appgroupbastionip.id
  }
}
