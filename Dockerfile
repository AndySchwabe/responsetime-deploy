FROM alpine:3.10

LABEL MAINTAINER="Andy Schwabe" \
    DOCKER_TAG="responsetime_deploy:latest" \
    vcs-url="https://github.com/AndySchwabe/responsetime-deploy" \
    vcs-ref="$SOURCE_COMMIT"

COPY entrypoint.sh /entrypoint.sh

RUN apk add --upgrade --no-cache python3 make groff go dep \
    && pip3 install pip awscli --upgrade \
    && rm -rf /var/cache/apk/* \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["all"]
