az pipelines create `
--name 'Deploy ADF' `
--repository DE `
--branch adf_publish `
--repository-type tfsgit `
--yml-path YML/deploy-adf.yml `
--skip-run 