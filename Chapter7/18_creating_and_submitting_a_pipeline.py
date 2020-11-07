...

# Submit pipeline
pipeline = Pipeline(workspace=workspace, steps=[trainStep])
published_pipeline = pipeline.publish(
    name='HighSpenders',
    description='High spenders model',
    continue_on_step_failure=False)

open('highspenders.id', 'w').write(published_pipeline.id)
