# Docker CI Helm
[![Docker Automated build](https://img.shields.io/docker/automated/ovalmoney/ci-helm.svg)](https://hub.docker.com/r/ovalmoney/ci-helm/)
[![Docker Pulls](https://img.shields.io/docker/pulls/ovalmoney/ci-helm.svg)](https://hub.docker.com/r/ovalmoney/ci-helm/)
[![Docker Build Status](https://img.shields.io/docker/build/ovalmoney/ci-helm.svg)](https://hub.docker.com/r/ovalmoney/ci-helm/)

Helm Docker image 

## Requirements

Credentials must be set using kubeconfig file `~/.kube/config`

## Example usage

```
# Create kubeconfig file from env var
echo $KUBECONFIG_FILE | base64 -d > ~/.kube/config

# Deploy app
helm upgrade MY_RELEASE ./MY_CHART \
  -f ./MY_CHART/MY_VALUES.yaml \
  --kube-context MY_CONTEXT \
  --install \
  --wait \
  --namespace MY_NAMESPACE \
  --set MY_KEY=MY_VALUE
```