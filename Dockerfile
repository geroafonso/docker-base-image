FROM golang:1.13-buster
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y locales unzip \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV LANG en_US.utf8

# SOPS
ENV SOPS_VERSION 3.7.3
RUN wget -q https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/local/bin/sops; \
    chmod +x /usr/local/bin/sops

# HELM
ENV HELM_VERSION v3.12.0
RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz; \
    tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz; \
    rm helm-${HELM_VERSION}-linux-amd64.tar.gz; \
    chmod +x linux-amd64/helm; \
    mv linux-amd64/helm /usr/bin/helm

# HELMFILE
ENV HELMFILE_VERSION 0.153.1
RUN wget -q https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_amd64.tar.gz; \
    tar -zxvf helmfile_${HELMFILE_VERSION}_linux_amd64.tar.gz; \
    mv helmfile /usr/local/bin/helmfile && chmod +x /usr/local/bin/helmfile

# HELM PLUGINS
RUN helm plugin install https://github.com/aslafy-z/helm-git
RUN helm plugin install https://github.com/databus23/helm-diff
RUN helm plugin install https://github.com/jkroepke/helm-secrets --version v4.4.2

# kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl; \
    chmod +x ./kubectl; \
    mv ./kubectl /usr/local/bin/kubectl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install
