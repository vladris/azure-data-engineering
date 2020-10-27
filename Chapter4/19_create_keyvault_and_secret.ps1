az group create --location "Central US" --name prod-rg

az keyvault create `
--location "Central US" `
--name "prodkv$suffix" `
--resource-group prod-rg

az keyvault secret set `
--name prodsppwd `
--value $prodsp.password `
--vault-name "prodkv$suffix"