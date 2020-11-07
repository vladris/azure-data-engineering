import json
from os import listdir, path

dir = path.join('ADF', 'pipeline')
for file in listdir(dir):
    with open(path.join(dir, file)) as f:
        pipeline = json.load(f)
        has_doc = False
        for annotation in pipeline['properties']['annotations']:
            if annotation.startswith('DataContract:'):
                has_doc = True
                doc = path.join('Docs', annotation.split(':')[1])
                if not path.exists(doc):
                    raise Exception('Data contract not found: ' + doc)
        if not has_doc:
            raise Exception('Pipeline ' + file + ' has no data contract')
