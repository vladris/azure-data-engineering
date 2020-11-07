$pipelineId = Get-Content -Path highspenders.id

az ml run submit-pipeline `
--pipeline-id $pipelineId `
--workspace-name aml `
--resource-group aml-rg
