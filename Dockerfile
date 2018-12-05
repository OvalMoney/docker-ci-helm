FROM alpine:3.7

# Metadata
LABEL org.label-schema.vcs-url="https://github.com/OvalMoney/docker-ci-helm"

ENV KUBECTL_VERSION v1.13.0
ENV HELM_VERSION v2.11.0
ENV PACKAGE_NAME helm-${HELM_VERSION}-linux-amd64.tar.gz
ENV HELM_S3_VERSION 0.8.0

RUN apk --no-cache add \ 
      bash \
      curl \
      git \
      openssh-client \
      jq

# Install Kubectl
RUN curl -SL https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl

#Install Helm
RUN curl -SL http://storage.googleapis.com/kubernetes-helm/${PACKAGE_NAME} \
 | tar -xzv --strip-components=1 -C /usr/local/bin linux-amd64/helm \
 && helm init --client-only

# Install Helm Plugin
RUN helm plugin install https://github.com/hypnoglow/helm-s3.git --version $HELM_S3_VERSION
