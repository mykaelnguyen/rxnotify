## BUILDING
##   (from project root directory)
##   $ docker build -t node-js-for-mykaelnguyen-rxnotify .
##
## RUNNING
##   $ docker run -p 3000:3000 node-js-for-mykaelnguyen-rxnotify
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r9

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="w6gk2hd" \
    STACKSMITH_STACK_NAME="Node.js for mykaelnguyen/rxnotify" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install node-6.4.0-0 --checksum 41d5a7b17ac1f175c02faef28d44eae0d158890d4fa9893ab24b5cc5f551486f

ENV PATH=/opt/bitnami/node/bin:/opt/bitnami/python/bin:$PATH \
    NODE_PATH=/opt/bitnami/node/lib/node_modules

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Node base template
COPY . /app
WORKDIR /app

RUN npm install

CMD ["node"]
