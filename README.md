# Azure Hybrid Cloud Landing Zone Project

The project are created to work suitable in Taiwan.

If you are using your own Azent Tenant with muliple resource groups, you will need to modify the scripts to use you own resource group/location before running the script.

## Environments
- Location: `eastus2`
- Personal DNS: `aliez.tw` on Cloudflare
- Terraform: `v1.2.4` via brew

## Todo
- [ ] Landing Zone
  - [ ] Create vnet Hub for Central Control
  - [ ] Create vnet Spoke for Lab
  - [ ] Peering Hub and Spoke
  - [ ] Run a Network Virtual Appliance (NVA)
- [ ] Azure Red Hat OpenShift
  - [ ] Create vnet Spoke for Azure Red Hat OpenShift
  - [ ] Peering Hub and Spoke for ARO
  - [ ] Clean Up
- [ ] Azure VMware Solution
  - [ ] Create vnet Spoke for Azure VMware Solution
  - [ ] Peering Hub and Spoke for AVS
  - [ ] Clean Up
- [ ] Azure Kubernetes Services
- [ ] On-premise AD
  - [ ] DNS
  - [ ] AD
  - [ ] WSUS
- [ ] Active AD
  - [ ] AD Connect
  - [ ] DNS


### Landing Zone
- Resource Groups: `rg-azure-critical`
- vnet: `aliez-vnet-hub`




## References
- [Cloud Adoption Framework - Azure landing zone][1]
- [Azure VMware Solution Network Decision Tree][2]

[1]: https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/
[2]: https://github.com/Azure/AzureCAT-AVS/tree/main/networking