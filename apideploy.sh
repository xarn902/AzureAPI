#!/bin/bash
MODEL_NAME=demo_model #REPLACE with your model
MODEL_PATH="./$MODEL_NAME"
CONTAINER_NAME="$MODEL_NAME"
sudo docker run -d --name serving_base tensorflow/serving
sudo docker cp "$MODEL_PATH" serving_base:"/models/$MODEL_NAME"
sudo docker commit --change "ENV MODEL_NAME $MODEL_NAME" serving_base "$CONTAINER_NAME"
sudo docker run -d -p 8501:8501 "$MODEL_NAME"

curl -d '{"signature_name": "serving_default", "instances": [[10.0],[9.0]]}' -X POST "http://localhost:8501/v1/models/$MODEL_NAME:predict"
