## BUILDING
##   (from project root directory)
##   $ docker build -t node-js-for-binderjoe-todomvc .
##
## RUNNING
##   $ docker run -p 3000:3000 node-js-for-binderjoe-todomvc
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/bitnami-containers/minideb-extras:jessie-r14-buildpack

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="tlw30o5" \
    STACKSMITH_STACK_NAME="Node.js for binderjoe/todomvc" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 libssl1.0.0 libncurses5 libtinfo5 libsqlite3-0 zlib1g libbz2-1.0 libreadline6 libstdc++6 libgcc1 ghostscript imagemagick libmysqlclient18

RUN bitnami-pkg install node-9.2.0-0 --checksum 0f4f6e7d0f87745e8f61848974fb42fde6e959e9761cccc1de5b72c2ba94dfe2

ENV PATH=/opt/bitnami/node/bin:/opt/bitnami/python/bin:$PATH \
    NODE_PATH=/opt/bitnami/node/lib/node_modules

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Node base template
COPY . /app
WORKDIR /app

RUN npm install

CMD ["node"]
