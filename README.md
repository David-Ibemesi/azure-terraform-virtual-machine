**Project Description** **3/24/2026**

This is a self made environment to practice the basics of terraform while using git


**Project Structure**

root-
  |-envs-|
  |     |--dev.tf
  |     |--prod.tf
  |-main.tf ## contains the main code to deploy resources
  |-output.tf ## specifies the information to be shown when resources are deployed
  |-provider.tf ## shows which cloud provider should be used for this project
  |-README.md ## current file, displays basic information about the project
  |-terraform.tfvars ## used by default when deploying files, contains variable information for resources
  |-variable.tf ## used to store code variables and prevent hardcoding *intentionally "variable" and not "variables" for crash test*


**Project Goal**

Deploy a publically accessible virtual machine (VM) on Azure with best practices involving:
1. Sensitive passwords
2. Avoiding hardcoding values
3. Making main.tf reusable, having all dynamic values live in other variable files

**Structure of main.tf**

Here's the structure of the main terraform file and why it is designed that way:
1. Resource Group
2. Virtual Network (VNET)
3. Subnet
4. Internet Gateway (IGW)
5. IGW Association to VNET
6. Route Table (RT)
7. Network Interface Card (NIC)
8. Public IP Address
9. Network Security Group (NSG)
10. NSG Ingress Rules
11. NSG Egress Rules
12. Virtual Machine Instance
