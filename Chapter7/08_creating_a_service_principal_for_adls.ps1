$sp = az ad sp create-for-rbac | ConvertFrom-Json
$acc = az storage account show --name "adls$suffix" | ConvertFrom-Json

az role assignment create `
--role "Storage Blob Data Contributor" `
--assignee $sp.appId `
--scope $acc.id
