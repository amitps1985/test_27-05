terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "edfusion-rg"
    storage_account_name = "stg1983"
    container_name       = "container"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "ca0e89ec-4b6f-43aa-93b2-058a2da5be0d"

}