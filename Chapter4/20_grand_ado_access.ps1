$adoid = az ad app list `
--filter "startswith(displayName, 'dataengineering-$suffix')" `
--query "[0].appId" `

az keyvault set-policy `
--secret-permissions get list `
--name "prodkv$suffix" `
--spn $adoid