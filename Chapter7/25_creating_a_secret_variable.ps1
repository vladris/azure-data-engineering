az pipelines variable create `
--name SP_PASSWORD `
--pipeline-name "Deploy High Spenders model" `
--project DE `
--secret true `
--value $env:SP_PASSWORD
