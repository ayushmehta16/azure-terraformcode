# Create a Public IP

#resource "azurerm_public_ip" "appgroupip" {
# name                = "${var.app-ip_name}"
# resource_group_name = "${var.env}-${var.resource_group_name}"
# location            = "${var.location}"
# allocation_method   = "${var.allocation_method}"
# depends_on = [
#  azurerm_resource_group.appgroup
#]
#}
#
## Creating a Network Interface
#resource "azurerm_network_interface" "appgroupinterfacesecond" {
#  name                = "${var.appgroup_interface_second}"
#  location            = "${var.location}"
#  resource_group_name = "${var.env}-${var.resource_group_name}"
#
#  ip_configuration {
#    name                          = "Internal"
#    subnet_id                     = azurerm_subnet.public1.id
#    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id = azurerm_public_ip.appgroupip.id
#  }
#  depends_on = [
#    azurerm_subnet.public1,
#    azurerm_public_ip.appgroupip
#  ]
#}
#
##Creating key for Linux VM
#
#resource "tls_private_key" "linuxkey" {
# algorithm = "RSA"
# rsa_bits  = 4096
#}
#
#resource "local_file" "linuxpemkey" {
# filename = "linuxkey.pem"
# content  = tls_private_key.linuxkey.private_key_pem
# depends_on = [
#   tls_private_key.linuxkey
# ]
#}
#
## Creating Linux VM
#resource "azurerm_linux_virtual_machine" "linuxvm" {
# name                = "${var.linuxvm_name}"
# resource_group_name = "${var.env}-${var.resource_group_name}"
# location            = "${var.location}"
# size                = "${var.linuxvm_size}"
# admin_username      = "${var.linuxadmin_username}"
# #availability_set_id = azurerm_availability_set.appgroupset.id
# network_interface_ids = [
#   azurerm_network_interface.appgroupinterfacesecond.id
# ]
#
# admin_ssh_key {
#   username   = "${var.username}"
#   public_key = tls_private_key.linuxkey.public_key_openssh
# }
# os_disk {
#   caching              = "${var.caching}"
#   storage_account_type = "${var.linuxvm_storage_account_type}"
# }
#
# source_image_reference {
#   publisher = "${var.publisher}"
#   offer     = "${var.offer}"
#   sku       = "${var.sku}"
#   version   = "${var.os_version}"
# }
# depends_on = [
#   azurerm_network_interface.appgroupinterfacesecond,
#   azurerm_resource_group.appgroup,
#   tls_private_key.linuxkey
#
# ]
#}
#