variable "mssql_database" {
  type = map(object({
    name = string
    collation    = string
  license_type = string
  mssqlserver_name = string
  resource_group_name = string

  }))
}