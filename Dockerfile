# https://github.com/GoogleCloudPlatform/cloud-sdk-docker/blob/master/alpine/Dockerfile
# https://github.com/mhart/alpine-node/blob/4bda65ed82808dee414219ded31ca0a60d374418/Dockerfile
FROM mhart/alpine-node:11
LABEL maintainer="Rodrigo de Avila <rodrigo.avila@mailtop.com.br>"

ARG CLOUD_SDK_VERSION=225.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

ENV PATH /google-cloud-sdk/bin:$PATH

RUN apk --no-cache add \ 
  bash \
  curl \
  git \
  gnupg \
  groff \
  jq \
  less \
  libc6-compat \
  openssh-client \
  python \
  py-crcmod \
  py-pip \
  py2-pip && \
  pip install --upgrade pip awscli s3cmd && \
  mkdir /root/.aws && \
  curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  ln -s /lib /lib64 && \
  gcloud config set core/disable_usage_reporting true && \
  gcloud config set component_manager/disable_update_check true && \
  gcloud config set metrics/environment github_docker_image && \
  gcloud --version
VOLUME ["/root/.config"]
