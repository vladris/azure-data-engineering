$purviewId = "<use the managed identity application ID>"

az keyvault set-policy `
--secret-permissions get list `
--name purviewkv$suffix `
--spn $purviewId
