$me = az ad signed-in-user show --query objectId

$tenantId = az account show --query tenantId

az kusto cluster-principal-assignment create --cluster-name "adx$suffix" --resource-group adx-rg --principal-id $me --principal-type User --tenant-id $tenantId --role AllDatabasesAdmin --principal-assignment-name admin1