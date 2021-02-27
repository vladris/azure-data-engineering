$repo = az repos show --repository DE | ConvertFrom-Json

$pipeline = az pipelines show --name "Validate ADF pipelines" | ConvertFrom-Json

az repos policy build create `
--blocking true `
--branch master `
--build-definition-id $pipeline.id `
--repository-id $repo.id `
--enabled true `
--manual-queue-only false `
--queue-on-source-update-only false `
--display-name "ADF validation" `
--valid-duration 0
