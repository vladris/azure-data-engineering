...

# Auth
auth = ServicePrincipalAuthentication(
    tenant_id,
    service_principal_id,
    os.environ.get('SP_PASSWORD'))

# Workspace
workspace = Workspace(
    subscription_id = subscription_id,
    resource_group = resource_group,
    workspace_name = workspace_name,
    auth=auth)

# Datastore
datastore = Datastore.get(workspace, 'MLData')

# Compute target
compute_target = AmlCompute(workspace, 'd1compute')
