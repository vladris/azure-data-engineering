az group create `
--name datashare-rg `
--location "West US 2"

az datashare account create `
--name "datashare$suffix" `
--resource-group datashare-rg
