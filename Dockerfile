FROM alpine:3.6

# Metadata
LABEL org.label-schema.vcs-url="https://github.com/OvalMoney/docker-ci-helm"

ENV KUBECTL_VERSION v1.11.3
ENV HELM_VERSION v2.9.1
ENV PACKAGE_NAME helm-${HELM_VERSION}-linux-amd64.tar.gz
ENV HELM_S3_VERSION 0.7.0

RUN apk --no-cache add \ 
      bash \
      make \
      curl \
      git \
      openssh-client

ADD https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/

RUN chmod +x /usr/local/bin/kubectl

ADD http://storage.googleapis.com/kubernetes-helm/${PACKAGE_NAME} ./

RUN tar -xvf ${PACKAGE_NAME} \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -rf ${PACKAGE_NAME} linux-amd64/

RUN helm init --client-only

RUN helm plugin install https://github.com/hypnoglow/helm-s3.git --version $HELM_S3_VERSION
