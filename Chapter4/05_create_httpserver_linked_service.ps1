az datafactory linked-service create `
--factory-name "adf$suffix" `
--resource-group adf-rg `
--name bingcovid19 `
--properties '@bingcovid19.json'