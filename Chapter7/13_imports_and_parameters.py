from azureml.core import Workspace, Datastore, Dataset, Model
from azureml.core.authentication import ServicePrincipalAuthentication
from azureml.core.compute import AmlCompute
from azureml.core.conda_dependencies import CondaDependencies
from azureml.core.runconfig import RunConfiguration
from azureml.pipeline.core import Pipeline
from azureml.pipeline.steps.python_script_step import PythonScriptStep

tenant_id = '<your tenant ID>' 
subscription_id = '<your Azure subscription GUID>'
service_principal_id = '<your service principal ID>'
resource_group  = 'aml-rg'
workspace_name  = 'aml'
