# Argo CD + argo-vault-plugin

Aside from a few critical infrastructure components, MangaDex relies on [ArgoCD](https://argoproj.github.io/cd) to render Kustomize manifests
within a control k8s cluster and apply the rendered manifests on our workloads clusters.

The best way we are aware of to tie good security into this is to keep secrets in a HashiCorp Vault instance and pull them at rendering time to inject them in
manifests. Which [argocd-vault-plugin](https://github.com/argoproj-labs/argocd-vault-plugin) (AVP) facilitates greatly.

From an operational standpoint, and as per the Argo CD project's own recommendation, the best approach to plugins is to bake them directly in your Argo CD
image. This is what this image is for.

---

The published tags are in the format

```
argocd$ARGOCD_VERSION-avp$AVP_VERSION
```

We obviously provide no support for this all. We use it and share it mainly so you can fork it if you so desire.
