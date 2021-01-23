import argparse
from joblib import dump
import os
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier 
from sklearn.model_selection import train_test_split

parser = argparse.ArgumentParser()
parser.add_argument('--input', type=str, dest='model_input')

args = parser.parse_args()
model_input = args.model_input
df = pd.read_csv(model_input)

X = df[["Sessions", "PageViews"]]
y = df["HighSpender"]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=1)

knn = KNeighborsClassifier()
knn.fit(X_train, y_train)

score = knn.predict(X_test)

predictions = X_test.copy(deep=True)
predictions["Prediction"] = score
predictions["Actual"] = y_test

print(predictions)

if not os.path.isdir('outputs'):
    os.mkdir('outputs')

model_path = os.path.join('outputs', 'highspender.pkl') 
dump(knn, model_path)
