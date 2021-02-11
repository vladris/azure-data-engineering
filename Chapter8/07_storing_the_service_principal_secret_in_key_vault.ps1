az keyvault create `
--location "Central US" `
--name "purviewkv$suffix" `
--resource-group purview-rg

az keyvault secret set `
--name purviewsppwd `
--value $sp.password `
--vault-name "purviewkv$suffix"
