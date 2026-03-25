**Project Description** **3/24/2026**

This is a self-made environment to practice the basics of Terraform while using Git. The project demonstrates Infrastructure as Code (IaC) principles by deploying a publicly accessible Ubuntu virtual machine on Microsoft Azure with proper variable management and environment separation.


**Project Structure**

```
root/
├── envs/
│   ├── dev.tfvars     # Variables for development environment deployment
│   └── prod.tfvars    # Variables for production environment deployment
├── main.tf            # Main Terraform configuration with resource definitions
├── output.tf          # Output values displayed after deployment
├── provider.tf        # Azure provider configuration and requirements
├── README.md          # This documentation file
├── terraform.tfvars   # Default variable values (can be overridden)
└── variable.tf        # Variable declarations with defaults and descriptions
```


**Project Goal**

Deploy a publicly accessible virtual machine (VM) on Azure following Infrastructure as Code best practices:

1. **Sensitive data handling**: Securely manage passwords and secrets
2. **Avoid hardcoding**: All values are parameterized through variables
3. **Reusability**: `main.tf` is environment-agnostic, with dynamic values in separate variable files
4. **Environment separation**: Different configurations for dev/prod environments
5. **Version control**: Git integration for tracking infrastructure changes


**Prerequisites**

Before deploying this infrastructure, ensure you have the following installed and configured:

- **Terraform**: Version 1.0+ (download from [terraform.io](https://www.terraform.io/downloads))
- **Azure CLI**: For authentication (install from [docs.microsoft.com](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli))
- **Git**: For version control
- **Azure Subscription**: An active Azure account with appropriate permissions

**Azure Authentication**

```bash
# Login to Azure CLI
az login

# Verify your subscription
az account show

# Set your subscription (if you have multiple)
az account set --subscription "your-subscription-id"
```


**Structure of main.tf**

The main Terraform file is organized logically to create resources in dependency order:

1. **Resource Group**: Logical container for all Azure resources
2. **Virtual Network (VNET)**: Private network space for resource isolation
3. **Subnet**: Sub-division within the VNET for resource organization
4. **Network Security Group (NSG)**: Security rules allowing SSH access (port 22)
5. **Public IP Address**: Static public IP for external access to the VM
6. **Network Interface Card (NIC)**: Connects the VM to the network and public IP
7. **NSG Association**: Links the security group to the network interface
8. **Virtual Machine**: Ubuntu 22.04 LTS instance with password authentication


**Variables Overview**

All configuration values are parameterized to avoid hardcoding:

| Variable | Purpose | Default | Environment Override |
|----------|---------|---------|---------------------|
| `azurerm_resource_group_name` | Resource group identifier | `mynova_rg` | Yes |
| `azurerm_resource_group_location` | Azure region | `Canada Central` | Yes |
| `azurerm_virtual_network_name` | VNET name | `mynova_vnet` | Yes |
| `azurerm_virtual_network_address_space` | VNET CIDR | `10.0.0.0/24` | Yes |
| `azurerm_subnet_name` | Subnet name | `mynova_subnet` | Yes |
| `azurerm_subnet_address_prefixes` | Subnet CIDR | `10.0.1.0/24` | Yes |
| `azurerm_network_security_group_name` | NSG name | `mynova_nsg` | Yes |
| `azurerm_public_ip_name` | Public IP name | `mynova_public_ip` | Yes |
| `azurerm_public_ip_allocation_method` | IP allocation | `Static` | Yes |
| `azurerm_network_interface_name` | NIC name | `mynova_nic` | Yes |
| `azurerm_linux_virtual_machine_name` | VM name | `mynova_vm` | Yes |
| `azurerm_linux_virtual_machine_size` | VM size | `Standard_B2ats_v2` | Yes |
| `azurerm_linux_virtual_machine_admin_username` | SSH username | `azureuser` | Yes |
| `azurerm_linux_virtual_machine_admin_password` | SSH password | **Required** | Yes |

**Note**: The `admin_password` variable is marked as `sensitive = true` and must be provided at runtime or in a secure variable file (not committed to Git).


**Deployment Instructions**

**1. Clone and Navigate**

```bash
git clone <your-repo-url>
cd terraform-azure-vm
```

**2. Initialize Terraform**

```bash
terraform init
```

**3. Plan Deployment**

For development environment: 
Note that if the -var flag is not given, the password can be securely entered once the command is run.
```bash
terraform plan -var-file="envs/dev.tfvars" -var="azurerm_linux_virtual_machine_admin_password=YourSecurePassword123!"
```

For production environment:
```bash
terraform plan -var-file="envs/prod.tfvars" -var="azurerm_linux_virtual_machine_admin_password=YourSecurePassword123!"
```

**4. Apply Deployment**

For development:
```bash
terraform apply -var-file="envs/dev.tfvars" -var="azurerm_linux_virtual_machine_admin_password=YourSecurePassword123!"
```

For production:
```bash
terraform apply -var-file="envs/prod.tfvars" -var="azurerm_linux_virtual_machine_admin_password=YourSecurePassword123!"
```

**5. Verify Outputs**

After successful deployment, Terraform will display:
- `vm_public_ip`: Public IP address of the VM
- `vm_sku`: Ubuntu image details
- `vm_username`: Admin username
- `vm_source_image_reference`: Details of the Vm's operating system

**6. Connect to VM**

```bash
ssh azureuser@<vm_public_ip>
```

**7. Cleanup**

To destroy all resources:
Note that the -var value for the password is unimportant at this point, any value could be put in, but Azure would require "admin_password" has to fulfill 3 out of these 4 conditions: Has lower characters, Has upper characters, Has a digit, Has a special character other than "_"
```bash
terraform destroy -var-file="envs/dev.tfvars" -var="azurerm_linux_virtual_machine_admin_password=YourSecurePassword123!"
```


**Best Practices Demonstrated**

- **Variable Management**: Separation of concerns with dedicated variable files
- **Environment Isolation**: Different configurations for dev/prod
- **Security**: Sensitive data handling, NSG rules
- **Reusability**: Generic main.tf that works across environments
- **Documentation**: Comprehensive README and inline comments
- **Version Control**: Git integration for infrastructure changes


**Troubleshooting**

**Common Issues:**

1. **Authentication Error**: Ensure `az login` is completed and subscription is set
2. **Resource Conflicts**: Check for existing resources with same names in your subscription
3. **Password Requirements**: Azure VMs require complex passwords (uppercase, lowercase, numbers, special chars)
4. **Region Availability**: Some VM sizes may not be available in `Canada Central`

**Debug Commands:**

```bash
# Check Terraform version
terraform version

# Validate configuration
terraform validate

# Show current state
terraform show

# List resources
terraform state list
```

**Cost Considerations:**

- VM size `Standard_B2ats_v2` incurs compute costs while running
- Static public IP has a small hourly charge
- Clean up resources with `terraform destroy` when not needed


**Contributing**

1. Create a feature branch: `git checkout -b feature/new-improvement`
2. Make changes and test locally
3. Commit with descriptive messages: `git commit -m "Add: new feature description"`
4. Push and create pull request

**License**

This project is for educational purposes. Use at your own risk.
