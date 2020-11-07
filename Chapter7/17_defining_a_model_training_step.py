...

# Train step
trainStep = PythonScriptStep(
    script_name='highspenders.py',
    arguments=['--input', model_input],
    inputs=[model_input],
    runconfig=run_config,
    compute_target=compute_target)
