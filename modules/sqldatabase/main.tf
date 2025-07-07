resource "azurerm_mssql_database" "db" {
  name                = var.name
  server_id           = var.server_id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  license_type        = "LicenseIncluded"
  sku_name            = "Basic"
  max_size_gb         = 2
}
