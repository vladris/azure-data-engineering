$adf = az datafactory factory show --name "adf$suffix"  --resource-group adf-rg `
| ConvertFrom-Json

$acc = az storage account show --name "adls$suffix" | ConvertFrom-Json
 
az role assignment create `
--role "Storage Blob Data Contributor" `
--assignee $adf.identity.principalId `
--scope $acc.id
