variable "mssql_server" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    version = string
    minimum_tls_version = string
    kv_name = string
    username_sqlkey = string
    password_sqlkey = string
  }))
}
