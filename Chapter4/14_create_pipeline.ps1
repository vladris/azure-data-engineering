az datafactory pipeline create `
--factory-name "adf$suffix" `
--name ingestcovid19data `
--resource-group adf-rg `
--pipeline '@ingestcovid19data.json'