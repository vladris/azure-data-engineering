$adf = az datafactory factory show `
--name "prodadf$suffix" --resource-group prod-rg `
| ConvertFrom-Json

az monitor metrics alert create `
--name pipelinefailure `
--resource-group prod-rg `
--scopes $adf.id `
--condition "total PipelineFailedRuns > 0" `
--window-size 5m `
--evaluation-frequency 5m `
--description "Pipeline failure" `
--action notify