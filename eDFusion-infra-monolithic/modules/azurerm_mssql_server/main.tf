resource "azurerm_mssql_server" "server" {
  for_each                     = var.mssql_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  minimum_tls_version          = each.value.minimum_tls_version
  administrator_login          = data.azurerm_key_vault_secret.admin_sql_username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.admin_sql_password[each.key].value
}
data "azurerm_key_vault" "kv" {
  for_each            = var.mssql_server
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault_secret" "admin_sql_username" {
  for_each     = var.mssql_server
  name         = each.value.username_sqlkey
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "admin_sql_password" {
  for_each     = var.mssql_server
  name         = each.value.password_sqlkey
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
