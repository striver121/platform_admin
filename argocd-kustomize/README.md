#### Argocd using Kustomization inorder to isolate the different envs with the same base. Also "application" directory can be use to point terraform helm build argocd's applications in order to spin up different slave argocds which managed by it's own (topoology: argocd can manage slave argocds).

#### Require Kustomization to be install locally to test kustomization builds and configure argocd CM as to enable the kustomization plugin enable.

#### This also include sops-helm encryption and decryption using kustomize-sopssecretgenerator.
https://github.com/goabout/kustomize-sopssecretgenerator
