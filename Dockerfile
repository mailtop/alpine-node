FROM mhart/alpine-node:10
LABEL maintainer="Rodrigo de Avila <rodrigo.avila@mailtop.com.br>"

RUN apk --no-cache add \ 
      bash \
      curl \
      less \
      groff \
      jq \
      git \
      python \
      py-pip \
      py2-pip && \
      pip install --upgrade pip awscli s3cmd && \
      mkdir /root/.aws
