az extension add -n kusto

az group create --location "Central US" --name adx-rg

az kusto cluster create --location "Central US" --cluster-name "adx$suffix" ` --resource-group adx-rg --sku name='Dev(No SLA)_Standard_D11_v2' capacity=1 tier='Basic'    
