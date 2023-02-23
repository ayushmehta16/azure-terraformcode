# Creating Storage

resource "azurerm_storage_account" "appgroupstorageaccount" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${var.env}-${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"
  account_kind             = "${var.account_kind}"
  depends_on = [
    azurerm_resource_group.appgroup
  ]
}

# Creating container insdie storage

resource "azurerm_storage_container" "data" {
  name                    = "${var.container_name}"
  storage_account_name    = "${var.storage_account_name}"
  container_access_type   = "${var.container_access_type}"
  depends_on = [
    azurerm_storage_account.appgroupstorageaccount
  ]
} 