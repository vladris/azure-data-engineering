...

# Python package configuration 
conda_deps = CondaDependencies.create(pip_packages=['pandas', 'sklearn', 'azureml-core', 'azureml-dataprep'])
run_config = RunConfiguration(conda_dependencies=conda_deps)
