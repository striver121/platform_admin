FROM golang:1.21 as builder

RUN git clone --branch=20200403-1 --depth=1 https://github.com/camptocamp/helm-sops \
  && cd helm-sops \
  && go build

FROM argoproj/argocd:v2.5.22

USER root

RUN apt-get update \
  && apt-get install -y \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg

RUN ["/bin/bash", "-c", "echo deb https://packages.cloud.google.com/apt cloud-sdk main | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list"]
RUN ["/bin/bash", "-c", "curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -"]

RUN apt-get update \
  && apt-get install -y google-cloud-sdk \
  && apt-get install -y vim-tiny

COPY --from=builder /go/helm-sops/helm-sops /usr/local/bin
RUN cd /usr/local/bin \
  && mv helm _helm \
  && mv helm-sops helm \
  && ln helm helm2 \
  && ln helm helm3

USER 999
