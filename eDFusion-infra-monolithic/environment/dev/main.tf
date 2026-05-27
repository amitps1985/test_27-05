module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}
module "storage_account" {
  source     = "../../modules/azurerm_storage_account"
  stgs       = var.stgs
  depends_on = [module.resource_group]
}
module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
  depends_on = [module.resource_group]
}
module "virtual_network" {
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.resource_group]
}
module "linux_virtual_machine" {
  source     = "../../modules/azurerm_compute"
  vms        = var.vms
  depends_on = [module.public_ip, module.subnet]
}
module "subnet" {
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.virtual_network]
}
module "key_vault" {
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
  depends_on = [module.resource_group]
}
module "nsg" {
  source     = "../../modules/azurerm_network_security"
  nsgs       = var.nsgs
  depends_on = [module.resource_group]
}
module "server" {
  source       = "../../modules/azurerm_mssql_server"
  mssql_server = var.mssql_server
  depends_on   = [module.resource_group]
}
module "database" {
  source         = "../../modules/azurerm_mssql_database"
  mssql_database = var.mssql_database
  depends_on     = [module.server]
}
