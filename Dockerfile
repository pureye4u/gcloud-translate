FROM node:9.11.2
MAINTAINER pureye4u<pureye4u@gmail.com>

RUN mkdir -p /app
WORKDIR /app
ADD . /app
ADD ./credentials.json /app
RUN npm install
RUN export GOOGLE_APPLICATION_CREDENTIALS="./credentials.json"

EXPOSE 3000

CMD ["npm", "start"]
