resource "azurerm_virtual_network" "demovnet01" {
    name = "${var.vnetname}"
    resource_group_name = "${var.env}-${var.resource_group_name}"
    location = "${azurerm_resource_group.appgroup.location}"
    address_space = "${var.address_space}"
    depends_on = [
        azurerm_resource_group.appgroup
  ]
}

# # Creating Subnets

resource "azurerm_subnet" "public1" {
  name                 = "${var.public1_name}"
  resource_group_name  = "${var.env}-${var.resource_group_name}"
  virtual_network_name = "${var.vnetname}"
  address_prefixes     = "${var.public1_cidr}"
  depends_on = [
    azurerm_virtual_network.demovnet01
  ]
}
 
#resource "azurerm_subnet" "public2" {
#  name                 = "${var.public2_name}"
#  resource_group_name  = "${var.env}-${var.resource_group_name}"
#  virtual_network_name = "${var.vnetname}"
#  address_prefixes       = "${var.public2_cidr}"
#  depends_on = [
#    azurerm_virtual_network.demovnet01
#  ]
#}
 
resource "azurerm_subnet" "private1" {
  name                 = "${var.private1_name}"
  resource_group_name  = "${var.env}-${var.resource_group_name}"
  virtual_network_name = "${var.vnetname}"
  address_prefixes       = "${var.private1_cidr}"
  depends_on = [
    azurerm_virtual_network.demovnet01
  ]
}
 
#resource "azurerm_subnet" "private2" {
#  name                 = "${var.private2_name}"
#  resource_group_name  = "${var.env}-${var.resource_group_name}"
#  virtual_network_name = "${var.vnetname}"
#  address_prefixes       = "${var.private2_cidr}"
#  depends_on = [
#    azurerm_virtual_network.demovnet01
#  ]
#}

# Creating a NSG
resource "azurerm_network_security_group" "appgroupnsg" {
  name                = "${var.nsg_name}"
  location            = "${var.location}"
  resource_group_name = "${var.env}-${var.resource_group_name}"
  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  depends_on = [
    azurerm_resource_group.appgroup
  ]
}

# Attached NSG with private1
resource "azurerm_subnet_network_security_group_association" "appgroupnsglink" {
  subnet_id                 = azurerm_subnet.private1.id
  network_security_group_id = azurerm_network_security_group.appgroupnsg.id
}

# Creating a NSG for private2
#resource "azurerm_network_security_group" "appgroupnsg1" {
#  name                = "${var.security_group_name}"
#  location            = "${var.location}"
#  resource_group_name = "${var.env}-${var.resource_group_name}"
#  security_rule {
#    name                       = "AllowSSH"
#    priority                   = 300
#    direction                  = "Inbound"
#    access                     = "Allow"
#    protocol                   = "Tcp"
#    source_port_range          = "*"
#    destination_port_range     = "22"
#    source_address_prefix      = "*"
#    destination_address_prefix = "*"
#  }
#
#  depends_on = [
#    azurerm_resource_group.appgroup
#  ]
#}
#
## Attached NSG with private2
#resource "azurerm_subnet_network_security_group_association" "appgroupnsglink2" {
#  subnet_id                 = azurerm_subnet.private2.id
#  network_security_group_id = azurerm_network_security_group.appgroupnsg1.id
#}