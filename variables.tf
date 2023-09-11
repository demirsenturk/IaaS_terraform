# Resource Group Name
variable "resource_group_name" {
  type        = string
  default     = "rsg-domain_controller"
  description = "name of the resource group."
}

# Azure Region 
variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created. Please review the Hosting Standard to select a approved location"
  default     = "NorthEurope" # Azure Region https://learn.microsoft.com/en-us/dotnet/api/azure.core.azurelocation?view=azure-dotnet
}

variable "vnet_name" {
  type        = string
  default     = "mainnetwork-dualstack"
  description = "name of the virtual network."
}

# Overall IPv4 and IPv6 Address Space for the vNET
variable "vnet_address_space" {
  description = "The address space of the VNET"
  default = ["10.0.0.0/16","fd00:db8:deca::/48"] # IPv4, IPv6 Space
}

# IPv4 and ipV6 Space allocated for Subnet 
variable "IPv6-Subnet" {
  description = "The subnet to be used"
  default = ["10.0.0.0/24","fd00:db8:deca:daed::/64"] # IPv4, IPv6 Space
}

variable "subnet_prefix" {
  type = list
  default = [
    {
      ip      = ["10.0.1.0/24","fd00:db8:deca:daea::/64"] # "10.0.1.0/24" for IPv4 only
      name     = "subnet-1"
    },
    {
      ip      = ["10.0.2.0/24","fd00:db8:deca:daeb::/64"]
      name     = "subnet-2"
    },
    {
      ip      = ["10.0.3.0/24","fd00:db8:deca:daec::/64"]
      name     = "subnet-3"
    },
    {
      ip      = ["10.0.4.0/24","fd00:db8:deca:daed::/64"]
      name     = "subnet-4"
    },
    {
      ip      = ["10.0.5.0/24","fd00:db8:deca:daee::/64"]
      name     = "subnet-5"
    }
   ]
}