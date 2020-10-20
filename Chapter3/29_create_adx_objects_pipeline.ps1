git add *
git commit -m "ADX objects pipeline"
git push

az pipelines create --name 'Deploy ADX objects' --repository DE --repository-type tfsgit --yml-path YML/deploy-adx-objects.yml --skip-run