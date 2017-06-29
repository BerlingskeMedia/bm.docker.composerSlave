FROM php:7.0

MAINTAINER Mateusz Lerczak <mlerczak@pl.sii.eu>

ARG USER_ID=1502
ARG USER_NAME=development

RUN useradd -u ${USER_ID} -ms /bin/bash ${USER_NAME} \
    && chown -R ${USER_NAME}:${USER_NAME} /srv

RUN apt-get update && apt-get install git -y

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

USER ${USER_NAME}

WORKDIR /srv