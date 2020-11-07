$repo = az repos show --repository DE | ConvertFrom-Json

az repos policy required-reviewer create `
--blocking true `
--branch master `
--enabled true `
--message "A data engineering team member needs to review this change" `
--repository-id $repo.id `
--required-reviewer-id "Data Engineering" `
--path-filter "/ADX/*"
