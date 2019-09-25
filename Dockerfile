FROM alpine:3.10

LABEL MAINTAINER="Andy Schwabe" \
    DOCKER_TAG="responsetime_deploy:latest"

COPY entrypoint.sh /entrypoint.sh

RUN apk add --upgrade --no-cache python3 \
    && pip3 install pip awscli --upgrade \
    && rm -rf /var/cache/apk/* \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
