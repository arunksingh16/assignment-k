#############################################################################
# VARIABLES
#############################################################################

variable "resource_group_name" {
  type = string
  default = "rg-tf-test"
}

variable "prefix" {
  description = "The prefix used for all resources in this example"
  default = "dev"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "subnet_1" {
  type    = string
  default = "subnet1"
}

variable "subnet_2" {
  type    = string
  default = "subnet2"
}

variable "subnet_3" {
  type    = string
  default = "subnet3"
}

variable "linuxvmsize" {
  type    = string
  default = "Standard_DS1_v2"
}

