resource "azurerm_mssql_database" "database" {
  for_each = var.mssql_database
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.server[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
}


data "azurerm_mssql_server" "server" {
  for_each = var.mssql_database
  name = each.value.mssqlserver_name
  resource_group_name = each.value.resource_group_name
}