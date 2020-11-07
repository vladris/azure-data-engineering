...

# Register model
from azureml.core import Model
from azureml.core.run import Run

run = Run.get_context()
workspace = run.experiment.workspace
model = Model.register(
    workspace=workspace,
    model_name='highspender',
    model_path=model_path)    
