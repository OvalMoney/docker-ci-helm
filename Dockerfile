FROM alpine:3.6

# Metadata
LABEL org.label-schema.vcs-url="https://github.com/OvalMoney/docker-ci-helm"

ENV HELM_LATEST_VERSION v2.7.0
ENV HELM_PACKAGE_NAME helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz
ENV HELM_S3_VERSION 0.4.1

ADD http://storage.googleapis.com/kubernetes-helm/${HELM_PACKAGE_NAME} ./

RUN tar -xvf ${HELM_PACKAGE_NAME} \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -rf ${HELM_PACKAGE_NAME} linux-amd64/

RUN helm plugin install https://github.com/hypnoglow/helm-s3.git --version $HELM_S3_VERSION