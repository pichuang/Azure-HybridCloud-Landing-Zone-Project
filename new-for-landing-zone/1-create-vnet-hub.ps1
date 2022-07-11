#!/usr/bin/env pwsh

$vnet_hub_name = 'aliez-vnet-hub'

# Get resource group and set to variable $rg_hub_name
# $rg_hub_name = az group list --query '[].name' -o tsv
# or
$rg_hub_name = 'rg-azure-critical'

#
# Assign location variable to resource group location
#
# Azure CLI with Powershell:
# az account list-locations --query "[].{DisplayName:displayName, Name:name,region:regionalDisplayName}" -o table |  Select-String -Pattern "Stage" -NotMatch
#
# Azure CLI with Zsh:
# az account list-locations --query "[].{DisplayName:displayName, Name:name,region:regionalDisplayName}" -o table | grep -v "Stage"
#
# $location = az group list --query '[].location' -o tsv
# or
$location = 'eastus2'

# Create vnet for Hub

# One Command
# az network vnet create --name aliez-hub --resource-group rg-eastus2 --location eastus2 --address-prefixes 10.0.0.0/16
#
az network vnet create --name $vnet_hub_name --resource-group $rg_hub_name --location $location --address-prefixes 10.0.0.0/16

# Create subnets for vnet Hub
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name lab-subnet --address-prefixes 10.0.0.0/24
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name firewall-untrust-subnet --address-prefixes 10.0.1.0/24
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name firewall-trusted-subnet --address-prefixes 10.0.2.0/24
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name loadbalancer-untrust-subnet --address-prefixes 10.0.3.0/24
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name loadbalancer-trusted-subnet --address-prefixes 10.0.4.0/24
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name azure-router-server-subnet --address-prefixes 10.0.5.0/24
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name gateway-subnet --address-prefixes 10.0.6.0/24
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name azure-bastion-subnet --address-prefixes 10.0.14.0/24
az network vnet subnet create --resource-group $rg_hub_name --vnet-name $vnet_hub_name --name network-management-subnet --address-prefixes 10.0.15.0/24

# Show list of subnets in vnet Hub
az network vnet subnet list --resource-group $rg_hub_name --vnet-name $vnet_hub_name

# Delete vnet Hub
#
# az network vnet delete --name aliez-hub --resource-group rg-azure-critical
#