az pipelines create `
--name 'Validate ADF pipelines' `
--repository DE `
--repository-type tfsgit `
--yml-path YML/validate-adf.yml `
--skip-run
