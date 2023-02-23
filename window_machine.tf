# Creating a Network Interface
resource "azurerm_network_interface" "appgroupinterfacefirst" {
  name                            = "${var.appgroup_interface_first}"
  location                        = "${var.location}"
  resource_group_name             = "${var.env}-${var.resource_group_name}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private1.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.appip.id
  }
  depends_on = [
    azurerm_subnet.private1,
    #azurerm_public_ip.appip
  ]
}

resource "azurerm_windows_virtual_machine" "appvm" {
  name                = "${var.vm_name}"
  resource_group_name = "${var.env}-${var.resource_group_name}"
  location            = "${var.location}"
  size                = "${var.size}"
  admin_username      = "${var.admin_username}"
  admin_password      = "${var.admin_password}"
  network_interface_ids = [
    azurerm_network_interface.appgroupinterfacefirst.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.appgroupinterfacefirst,
    azurerm_resource_group.appgroup
  ]
}