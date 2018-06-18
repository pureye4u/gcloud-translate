#!/bin/bash

# Variables
PROJECT_NAME=gcloud-translate
TARGET=master
TARGET_PORT=3000
CONTAINER_NAME=${PROJECT_NAME}-${TARGET}
IMAGE_NAME=${PROJECT_NAME}:${TARGET}

echo "TARGET: ${TARGET}"
echo "CONTAINER: ${PROJECT_NAME}"
echo "IMAGE: ${IMAGE_NAME}"

git checkout --track origin/${TARGET}

git pull

cp ~/credentials/google/29cm-global.json ./credentials.json

docker stop ${CONTAINER_NAME}

docker rm ${CONTAINER_NAME}

docker rmi ${IMAGE_NAME}

docker build -t ${IMAGE_NAME} .

docker run --name ${CONTAINER_NAME} -d -p ${TARGET_PORT}:3000 ${IMAGE_NAME}
