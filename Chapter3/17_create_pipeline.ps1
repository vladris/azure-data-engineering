git add *
git commit -m "ADX deployment pipeline"
git push

az pipelines create --name 'Deploy ADX' --repository DE --repository-type tfsgit --yml-path YML/deploy-adx.yml --skip-run