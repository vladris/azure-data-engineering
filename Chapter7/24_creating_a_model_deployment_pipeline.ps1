git add *
git commit -m "Deploy High Spenders model pipeline definition"
git push

az pipelines create `
--name "Deploy High Spenders model" `
--repository DE `
--repository-type tfsgit `
--yml-path YML/deploy-model-highspenders.yml `
--skip-run
