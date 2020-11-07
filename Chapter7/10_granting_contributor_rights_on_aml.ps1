$aml = az ml workspace show `
--workspace-name aml `
--resource-group aml-rg `
| ConvertFrom-Json

az role assignment create `
--role "Contributor" `
--assignee $sp.appId `
--scope $aml.id
