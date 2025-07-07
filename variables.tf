variable "resource_group_name" {}
variable "location" {}
variable "sql_server_name" {}
variable "sql_db_name" {}
variable "vm_count" {}
variable "vm_name_prefix" {}
variable "admin_username" {}
variable "admin_password" {}
variable "azure_credentials" {
  description = "Azure service principal credentials in JSON format"
  type        = string
}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}
