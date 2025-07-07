provider "azurerm" {
  subscription_id = "80d37f3a-a7f6-405b-a0d0-e2d362572306"
  features {}
}

module "sql_server" {
  source              = "./modules/sqlserver"
  name                = var.sql_server_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "sql_db" {
  source              = "./modules/sqldatabase"
  name                = var.sql_db_name
  server_id = module.sql_server.id
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "linux_vm" {
  source              = "./modules/linuxvm"
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}
