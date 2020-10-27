if (!$suffix) {
    Write-Output "`$suffix not set, please set it in $PROFILE"
    exit
}

az group create --location "Central US" --name adf-rg

az extension add --name datafactory

az datafactory factory create --location "Central US" --name "adf$suffix" --resource-group adf-rg

$bingcovid19 = @"
{
    "type": "HttpServer",
    "typeProperties": {
        "url": "https://pandemicdatalake.blob.core.windows.net/",
        "enableServerCertificateValidation": true,
        "authenticationType": "Anonymous"
    }
}
"@

$bingcovid19 | Out-File -FilePath bingcovid19.json

az datafactory linked-service create --factory-name "adf$suffix" --resource-group adf-rg --name bingcovid19 --properties '@bingcovid19.json'

$bingcovid19dataset = @"
{
    "linkedServiceName": {
        "referenceName": "bingcovid19",
        "type": "LinkedServiceReference"
    },
    "type": "Json",
    "typeProperties": {
        "location": {
            "type": "HttpServerLocation",
            "relativeUrl": "public/curated/covid-19/bing_covid-19_data/latest/bing_covid-19_data.json"
        }
    }
}
"@

$bingcovid19dataset | Out-File -FilePath bingcovid19dataset.json

az datafactory dataset create --factory-name "adf$suffix" --resource-group adf-rg --name bingcovid19dataset --properties '@bingcovid19dataset.json'

$sp = az ad sp create-for-rbac | ConvertFrom-Json

az kusto database-principal-assignment create --cluster-name "adx$suffix" --database-name telemetry --principal-id $sp.appId --principal-type App --role "Admin" --tenant-id $sp.tenant --principal-assignment-name adf --resource-group adx-rg

$tenant = $sp.tenant
$appId = $sp.appId
$password = $sp.password

$adx = @"
{
    "type": "AzureDataExplorer",
    "typeProperties": {
        "endpoint": "https://adx$suffix.centralus.kusto.windows.net",
        "tenant": "$tenant",
        "servicePrincipalId": "$appId",
        "servicePrincipalKey": "$password",
        "database": "telemetry"
    }
}
"@

$adx | Out-File -FilePath adx.json

az datafactory linked-service create --factory-name "adf$suffix" --resource-group adf-rg --name adx --properties '@adx.json'

$adxtempcovid19dataset = @"
{
    "linkedServiceName": {
        "referenceName": "adx",
        "type": "LinkedServiceReference"
    },
    "type": "AzureDataExplorerTable",
    "typeProperties": {
        "table": "Covid19Temp"
    }
}
"@

$adxtempcovid19dataset | Out-File -FilePath adxtempcovid19dataset.json

az datafactory dataset create --factory-name "adf$suffix" --resource-group adf-rg --name adxtempcovid19dataset --properties '@adxtempcovid19dataset.json'
