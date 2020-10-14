if (!$suffix) {
    Write-Output "`$suffix not set, please set it in $PROFILE"
    exit
}

az extension add -n kusto

az group create --location "Central US" --name adx-rg

az kusto cluster create --location "Central US" --cluster-name "adx$suffix" --resource-group adx-rg --sku name="Dev(No SLA)_Standard_D11_v2" capacity=1 tier="Basic"    

az kusto database create --cluster-name "adx$suffix" --database-name telemetry --resource-group adx-rg --read-write-database location="Central US"

$me = az ad signed-in-user show --query objectId

$tenantId = az account show --query tenantId

az kusto cluster-principal-assignment create --cluster-name "adx$suffix" --resource-group adx-rg --principal-id $me --principal-type User --tenant-id $tenantId --role AllDatabasesAdmin --principal-assignment-name admin1
