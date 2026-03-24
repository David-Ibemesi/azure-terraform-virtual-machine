# Create resource group
resource "azurerm_resource_group" "mynova_rg" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_resource_group_location

  tags = {
    Environment = var.environment
    Project     = "Terraform Learning"
    Owner       = "Student"
  }
}

# Create virtual network
resource "azurerm_virtual_network" "mynova_vnet" {
  resource_group_name = azurerm_resource_group.mynova_rg.name
  location            = azurerm_resource_group.mynova_rg.location
  name                = var.azurerm_virtual_network_name
  address_space       = [var.azurerm_virtual_network_address_space]
}

# Create subnet
resource "azurerm_subnet" "mynova_subnet" {
  resource_group_name  = azurerm_resource_group.mynova_rg.name
  virtual_network_name = azurerm_virtual_network.mynova_vnet.name
  name                 = var.azurerm_subnet_name
  address_prefixes     = [var.azurerm_subnet_address_prefixes]
}

# Create network security group and allow ssh
resource "azurerm_network_security_group" "mynova_nsg" {
  resource_group_name = azurerm_resource_group.mynova_rg.name
  location            = azurerm_resource_group.mynova_rg.location
  name                = var.azurerm_network_security_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefixes    = var.allowed_ssh_ips
    destination_address_prefix = "*"
  }

  tags = {
    Environment = var.environment
    Project     = "Terraform Learning"
  }
}

# Create public IP
resource "azurerm_public_ip" "mynova_public_ip" {
  resource_group_name = azurerm_resource_group.mynova_rg.name
  location            = azurerm_resource_group.mynova_rg.location
  name                = var.azurerm_public_ip_name
  allocation_method   = var.azurerm_public_ip_allocation_method
}

# Create network interface
resource "azurerm_network_interface" "mynova_nic" {
  resource_group_name = azurerm_resource_group.mynova_rg.name
  location            = azurerm_resource_group.mynova_rg.location
  name                = var.azurerm_network_interface_name

  ip_configuration {
    name                          = "mynova_ip_config"
    subnet_id                     = azurerm_subnet.mynova_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mynova_public_ip.id
  }
}

# Associate NIC with NSG
resource "azurerm_network_interface_security_group_association" "mynova_nic_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.mynova_nic.id
  network_security_group_id = azurerm_network_security_group.mynova_nsg.id
}

# Create 20.04 virtual machine with password authentication
resource "azurerm_linux_virtual_machine" "mynova_vm" {
  resource_group_name = azurerm_resource_group.mynova_rg.name
  location            = azurerm_resource_group.mynova_rg.location
  name                = var.azurerm_linux_virtual_machine_name
  size                = var.azurerm_linux_virtual_machine_size
  admin_username      = var.azurerm_linux_virtual_machine_admin_username
  admin_password      = var.azurerm_linux_virtual_machine_admin_password
  network_interface_ids = [
    azurerm_network_interface.mynova_nic.id,
  ]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    Environment = var.environment
    Project     = "Terraform Learning"
    OS          = "Ubuntu 22.04"
  }
}

