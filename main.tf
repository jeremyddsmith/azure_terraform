# Specify the Azure provider
provider "azurerm" {
  features {}
}

# Include variables file
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.99.0"
    }
  }
}

# Create Azure resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Create Azure virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  location            = azurerm_resource_group.example.location  # Use the location from the resource group
  resource_group_name = azurerm_resource_group.example.name
  address_space       = [var.vnet_address_space]
}


# Create public subnets
resource "azurerm_subnet" "public" {
  count                = length(var.public_subnet_prefixes)
  name                 = "public-subnet-${count.index + 1}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.public_subnet_prefixes[count.index]]
}

# Create private subnets
resource "azurerm_subnet" "private" {
  count                = length(var.private_subnet_prefixes)
  name                 = "private-subnet-${count.index + 1}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.private_subnet_prefixes[count.index]]
}
