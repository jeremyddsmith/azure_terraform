variable "resource_group_name" {
  description = "Name of the Azure resource group"
  default     = "jd-resource-group"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  default     = "10.0.0.0/16"
}

variable "public_subnet_prefixes" {
  description = "Prefixes for the public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_prefixes" {
  description = "Prefixes for the private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}
