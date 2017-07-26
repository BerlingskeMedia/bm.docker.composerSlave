FROM composer:latest

MAINTAINER Mateusz Lerczak <mlerczak@pl.sii.eu>

ARG USER_ID=2000
ARG USER_NAME="development"

ENV GITHUB_OAUTH "THIS_SHOULD_BE_YOUR_OAUTH"

RUN adduser -D -u ${USER_ID} -s /bin/bash ${USER_NAME}

COPY container/.ssh /home/${USER_NAME}/.ssh

RUN chown -R ${USER_NAME}:${USER_NAME} /app \
    && chown -R ${USER_NAME}:${USER_NAME} /composer \
    && chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}

USER ${USER_NAME}

COPY container/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
