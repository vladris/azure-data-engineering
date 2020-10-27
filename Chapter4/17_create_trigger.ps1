az datafactory trigger create `
--factory-name "adf$suffix" `
--resource-group adf-rg `
--name daily `
--properties '@daily.json'