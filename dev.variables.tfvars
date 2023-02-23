# Enviornment Variable

env                       = "dev"

# Azure Credential Details

azure_subscription_id     = "c2784b0e-e0ee-4dc8-aece-df71279dc191"
azure_client_id           = "a5ac51cf-2ed2-45f1-a069-11db080e43c6"
azure_client_secret       = "3ML8Q~xpVsExfEr63ScmycuAhEaIicdFrEVfNaG2"
azure_tenant_id           = "20e7e2bb-a121-4b6c-84b9-33635437dc43"

# Resource group and Location Details

resource_group_name       = "medvantx-pap-rg"
location                  = "East US"

# Storage Accounts Details

storage_account_name      = "terraformstorage7069"
account_tier              = "Standard"
account_replication_type  = "LRS"
account_kind              = "StorageV2"
container_name            = "tfstatecontainer"
container_access_type     = "container"

# ACR Details

registry_name             = "medvantxacr"

# Virtual Network 

vnetname                  = "medvantxvnet" 
address_space             = ["10.224.0.0/16"]
public1_name              = "public1"
#public2_name             = "public2"
private1_name             = "private1"
#private2_name            = "private2"
public1_cidr              = ["10.224.1.0/24"]
#public2_cidr             = ["10.224.2.0/24"]
private1_cidr             = ["10.224.3.0/24"]
#private2_cidr            = ["10.224.4.0/24"]
nsg_name                  = "medvantxnsg"
#security_group_name      = "appgroupnsg1"

# window machine and network interface

appgroup_interface_first  = "medvantx-first-interface"
vm_name                   = "testagent-vm"
size                      = "Standard_D2s_v3"
admin_username            = "adminuser"
admin_password            = "Azure@123"

# bastion

bastion_name              = "AzureBastionSubnet"
address_prefixes          =  ["10.224.10.0/24"]
bastion_ip_name           = "medvantx-bastion-ip"
bastion-name              = "medvantx-bastion"

# aks_cluster

azurerm_kubernetes_cluster = "aks-medvantx"
dns_prefix                 = "aks-medvantx-dns"
kubernetes_version         = "1.24.6"
agentpool_name             = "agentpool"
vm_size                    = "Standard_D2s_v3"
enable_auto_scaling        = "false"
node_count                 = "1"
network_plugin             = "azure"
load_balancer_sku          = "standard"
network_policy             = "azure"

#public ip

#app-ip_name       = "app-ip"
#allocation_method = "Static"
#
##second network interface
#
#appgroup_interface_second = "appgroupinterfacesecond"
#
##linuxvm
#
#linuxvm_name = "linuxvm"
#linuxvm_size = "Standard_B1s"
#linuxadmin_username = "linuxusr"
#username = "linuxusr"
#caching = "ReadWrite"
#linuxvm_storage_account_type = "Standard_LRS"
#publisher = "Canonical"
#offer = "0001-com-ubuntu-server-focal"
#sku = "20_04-lts"
#os_version = "latest"