#############################################################################
# Module for Windows VM Creation
#############################################################################

resource "azurerm_linux_virtual_machine" "linuxvm-1" {
    name                  = "${var.prefix}-linuxvm-1"
    location            = "${azurerm_resource_group.rg_main.location}"
    resource_group_name = "${azurerm_resource_group.rg_main.name}"
    network_interface_ids = ["${azurerm_network_interface.nic1.id}"]
    size                  = "${var.linuxvmsize}"

    os_disk {
        name              = "${var.prefix}-linuxvm-1-OSDisk"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "webserver"
    admin_username = "azureuser"
    admin_password = "${azurerm_key_vault_secret.winvm_kv_secret.value}"
    disable_password_authentication = false

    tags = {
      environment = "DEV"
    }
}


resource "azurerm_linux_virtual_machine" "linuxvm-2" {
    name                  = "${var.prefix}-linuxvm-2"
    location            = "${azurerm_resource_group.rg_main.location}"
    resource_group_name = "${azurerm_resource_group.rg_main.name}"
    network_interface_ids = ["${azurerm_network_interface.nic2.id}"]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "${var.prefix}-linuxvm-2-OSDisk"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "appserver"
    admin_username = "azureuser"
    admin_password = "${azurerm_key_vault_secret.winvm_kv_secret.value}"
    disable_password_authentication = false

    tags = {
      environment = "DEV"
    }
}

resource "azurerm_linux_virtual_machine" "linuxvm-3" {
    name                  = "${var.prefix}-linuxvm-3"
    location            = "${azurerm_resource_group.rg_main.location}"
    resource_group_name = "${azurerm_resource_group.rg_main.name}"
    network_interface_ids = ["${azurerm_network_interface.nic3.id}"]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "${var.prefix}-linuxvm-3-OSDisk"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "database"
    admin_username = "azureuser"
    admin_password = "${azurerm_key_vault_secret.winvm_kv_secret.value}"
    disable_password_authentication = false

    tags = {
      environment = "DEV"
    }
}

#############################################################################
# OUTPUTS
#############################################################################


output "linuxvm-1-name" {
  description = "The name of first linuxvm."
  value       = "${azurerm_linux_virtual_machine.linuxvm-1.name}"

}

output "linuxvm-2-name" {
  description = "The name of second linuxvm."
  value       = "${azurerm_linux_virtual_machine.linuxvm-2.name}"

}

output "linuxvm-3-name" {
  description = "The name of third linuxvm."
  value       = "${azurerm_linux_virtual_machine.linuxvm-2.name}"

}