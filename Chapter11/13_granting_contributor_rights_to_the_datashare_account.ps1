$datashare = az datashare account show --name "datashare$suffix" --resource-group datashare-rg | ConvertFrom-Json

az role assignment create `
--assignee $datashare.identity.principalId `
--role Contributor `
--scope $telemetry.id
