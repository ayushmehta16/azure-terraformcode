resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                    = "${var.azurerm_kubernetes_cluster}"
  location                = "${var.location}"
  resource_group_name     = "${var.env}-${var.resource_group_name}"
  dns_prefix              = "${var.dns_prefix}"
  kubernetes_version      = "${var.kubernetes_version}"
  private_cluster_enabled = true

  default_node_pool {
    name                  = "${var.agentpool_name}"
    vm_size = "${var.vm_size}"
    #orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    #availability_zones   = []
    enable_auto_scaling   = "${var.enable_auto_scaling}"
    node_count            = "${var.node_count}"
    #os_disk_size_gb      = 30
    vnet_subnet_id        = azurerm_subnet.private1.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin       = "${var.network_plugin}"
    load_balancer_sku    = "${var.load_balancer_sku}"
    network_policy       = "${var.network_policy}"
  }
}
