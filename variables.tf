# Enviornment Detail

variable "env" {
  type = string
}

# Azure Details

variable "azure_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}
variable "azure_client_id" {
  type        = string
  description = "Azure Client ID"
}
variable "azure_client_secret" {
  type        = string
  description = "Azure Client Secret"
}
variable "azure_tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

# Resource Group and Location Details

variable "resource_group_name" {
  type = string
}
variable "location" {
  type        = string
  description = "location of resource created"
}

# Storage Account Details 

variable "storage_account_name" {
  type = string
}
variable "account_tier" {
  type = string
}
variable "account_replication_type" {
  type = string
}
variable "account_kind" {
  type = string
}
variable "container_name" {
  type = string
}
variable "container_access_type" {
  type = string
}

# # ACR Details

variable "registry_name" {
  type = string
}

# Virtual Network

variable "vnetname" {
  type = string
}

variable "address_space" {
  type = list(any)
}

variable "public1_name" {
  type = string
}

#variable "public2_name" {
#  type = string
#}

variable "private1_name" {
  type = string
}

#variable "private2_name" {
#  type = string
#}


variable "public1_cidr" {
  type = list(any)
}

#variable "public2_cidr" {
#  type = list(any)
#}

variable "private1_cidr" {
  type = list(any)
}

#variable "private2_cidr" {
#  type = list(any)
#}

variable "nsg_name" {
  type = string
}

#variable "security_group_name" {
#  type = string
#}

#create network interface

variable "appgroup_interface_first" {
   type = string
  }
  
 variable "vm_name" {
   type = string
  }
  
  variable "size" {
   type = string
  }
  
  variable "admin_username" {
   type = string
  }
  
  variable "admin_password" {
   type = string
  }

#creating bastion

variable "bastion_name" {
 type = string
}

variable "address_prefixes" {
  type = list
}

variable "bastion_ip_name" {
  type = string
}

variable "bastion-name" {
  type = string
}

# creating aks cluster

variable "azurerm_kubernetes_cluster" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "agentpool_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "enable_auto_scaling" {
  type = bool
}

variable "node_count" {
  type = number
}

variable "network_plugin" {
  type = string
}

variable "load_balancer_sku" {
  type = string
}

variable "network_policy" {
  type = string
}

#creating public ip

#variable "app-ip_name" {
#  type = string
#}
#
#variable "allocation_method" {
#  type = string
#}
#
##creating second network interface
#
#
#variable "appgroup_interface_second" {
#  type = string
#}
#
##creating linux vm
#
#variable "linuxvm_name" {
#  type = string
#}
#
#variable "linuxvm_size" {
#  type = string
#}
#
#variable "linuxadmin_username" {
#  type = string
#}
#
#variable "username" {
#  type = string
#}
#
#variable "caching" {
#  type = string
#}
#
#variable "linuxvm_storage_account_type" {
#  type = string
#}
#
#variable "publisher" {
#  type = string
#}
#
#variable "offer" {
#  type = string
#}
#
#variable "sku" {
#  type = string
#}
#
#variable "os_version" {
#  type = string
#}