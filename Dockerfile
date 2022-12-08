ARG ARGO_VERSION
FROM quay.io/argoproj/argocd:v${ARGO_VERSION}

USER root

RUN apt update && \
    apt dist-upgrade -y && \
    apt install -qq -y --no-install-recommends curl gpg && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG AVP_VERSION
RUN curl -L -o argocd-vault-plugin https://github.com/argoproj-labs/argocd-vault-plugin/releases/download/v${AVP_VERSION}/argocd-vault-plugin_${AVP_VERSION}_linux_amd64 && \
    chmod -v +x argocd-vault-plugin && \
    mv -v argocd-vault-plugin /usr/local/bin && \
    argocd-vault-plugin version

USER 999
