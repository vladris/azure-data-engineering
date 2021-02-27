from azureml.core import Workspace, Datastore, Dataset, Model
from azureml.core.authentication import ServicePrincipalAuthentication
from azureml.core.compute import AmlCompute
from azureml.core.conda_dependencies import CondaDependencies
from azureml.core.runconfig import RunConfiguration
from azureml.pipeline.core import Pipeline
from azureml.pipeline.steps.python_script_step import PythonScriptStep
import os

tenant_id = '<your tenant ID>' 
subscription_id = '<your Azure subscription GUID>'
service_principal_id = '<your service principal ID>'
resource_group  = 'aml-rg'
workspace_name  = 'aml'

if not os.environ.get('SP_PASSWORD'):
    print("Please make sure the service principal password is stored in the SP_PASSWORD environment variable")
    exit()

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

# Input
model_input = Dataset.File.from_files([(datastore, '/models/highspenders/input.csv')]).as_mount()    

# Python package configuration 
conda_deps = CondaDependencies.create(pip_packages=['pandas', 'sklearn', 'azureml-core', 'azureml-dataprep'])
run_config = RunConfiguration(conda_dependencies=conda_deps)

# Train step
trainStep = PythonScriptStep(
    script_name='highspenders.py',
    arguments=['--input', model_input],
    inputs=[model_input],
    runconfig=run_config,
    compute_target=compute_target)

# Submit pipeline
pipeline = Pipeline(workspace=workspace, steps=[trainStep])
published_pipeline = pipeline.publish(
    name='HighSpenders',
    description='High spenders model',
    continue_on_step_failure=False)

open('highspenders.id', 'w').write(published_pipeline.id)
