build:
    docker build -t iris-classifier .

run-flask:
    docker run -p 5000:5000 iris-classifier:latest flask

train-model:
    docker run iris-classifier:latest training
