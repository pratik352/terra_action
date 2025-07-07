provider "azurerm" {
  features {}

  client_id       = jsondecode(var.azure_credentials).clientId
  client_secret   = jsondecode(var.azure_credentials).clientSecret
  tenant_id       = jsondecode(var.azure_credentials).tenantId
  subscription_id = jsondecode(var.azure_credentials).subscriptionId
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
