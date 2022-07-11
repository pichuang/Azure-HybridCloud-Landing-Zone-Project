#!/usr/bin/env pwsh

az network vnet delete --name aliez-vnet-hub --resource-group rg-azure-critical
az resource delete --name rg-azure-lab