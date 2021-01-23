az ml computetarget create `
amlcompute `
--max-nodes 1 `
--name "d1compute" `
--vm-size STANDARD_D1_V2 `
--workspace-name aml `
--resource-group aml-rg