variable "subnet_prefix" {
  type = list
  default = [
    {
      ip      = "10.0.1.0/24"
      name     = "subnet-1"
    },
    {
      ip      = "10.0.2.0/24"
      name     = "subnet-2"
    },
    {
      ip      = "10.0.3.0/24"
      name     = "subnet-3"
    },
    {
      ip      = "10.0.4.0/24"
      name     = "subnet-4"
    },
    {
      ip      = "10.0.5.0/24"
      name     = "subnet-5"
    }
   ]
}

variable "resource_group_name" {
  type        = string
  default     = "testProv"
  description = "name of the resource group."
}

variable "vnet_name" {
  type        = string
  default     = "prov_labvnet"
  description = "name of the virtual network."
}