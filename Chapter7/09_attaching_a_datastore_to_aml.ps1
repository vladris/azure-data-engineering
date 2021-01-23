az ml datastore attach-adls-gen2 `
--account-name "adls$suffix" `
--client-id $sp.appId `
--client-secret $sp.password `
--tenant-id $sp.tenant `
--file-system fs1 `
--name MLData `
--workspace-name aml `
--resource-group aml-rg