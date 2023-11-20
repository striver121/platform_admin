# Manage Argo CD using Argo CD!

Argocd managed by Argocd, let's call this topology as Argocd Master and Argocd Child/Slave, where Master considered to be a basic vendor shipped installation and simply holds/points it's repository to one/many child Argocd as an application/s. These topology leads to Apps manage Apps.
> You can find more gets on information about **Argocd manages Argocd** [here](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup#manage-argo-cd-using-argo-cd).

![Alt text](https://github.com/striver121/platform_admin/blob/master/images/Diagram.png)

These Child Argocd applications have customized based on your organization's needs and environment/s, also these reduces the management cost as this can be managed using CaC (Declarative GitOps) instead iAC where it watches the trigger for changes and also gives the ability to isolate the repositories. As ArgoCD watch/supports two hops of repos, i.e repo A calls repo B, if any changes happens in any repo Argocd can able to adopt those changes. In this repo example i have isolated repositories based on the organization needs. `Platform_Admin` manages purely Argocd Master, Argocd Childs and the Platform Apps which required to manage the kubernetes environment, on the other side `Platform_Devs`are more focused on applications related operations.
> App of Apps is an admin-only tool **Platform_Admins manges applications resources which points to Platform_Devs repo where application code reside and managed my Devs** [here](https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping/#app-of-apps-pattern).


### Argocd Master & Argocd Child:

After Deploying Argocd Master with Terraform or Helm, The master is pointed to a git repo called `argocd_kustomization` through a values.yaml where Master's argo-repo server reads the repo and spin up the Argocd Child application/s according to the CaC, the application/s defined using kustomization which have base (simply calling default Argocd from ArgoProj) and overlays (using base + completely custom child Argocd as per organization's requirements with custom image build who have the capabilities to read secrets (helm-sops) on the fly and can able to use GCP services).

### Master and Child Argocd Topology:
![Alt text](https://github.com/striver121/platform_admin/blob/master/images/Topology.jpg)

[Enlarge Topology in PDF](https://github.com/striver121/platform_admin/blob/master/images/Topology.pdf)


# Using Helm + Kustomize: 

### TL;DR 

You might want to use Helm and Kustomize together when:

-  You don’t have control over the Helm chart (it’s not yours).
-  You want different config for different environments.
-  You don’t want your secrets in a Helm chart, but you want them patched in by Kustomize.
-  Cross-cutting fields
-  Kubectl Native
- No need to install or manage as a separate dependency
- Plain Yaml
- No complex templating language
- Declarative
- Purely declarative (just like Kubectl)
- Multiple Configurations
- Manages any number of different configurations
- 
![Alt text](https://github.com/striver121/platform_admin/blob/master/Topology.jpg)

![Alt text](https://github.com/striver121/platform_admin/blob/master/Topology.jpg)

Compare Kustomize to native Helm and native Kubectl to better highlight the differentiated functionality that it offers.

**Read full documentation** [here](https://trstringer.com/helm-kustomize) **&** [here](https://medium.com/@tharukam/generate-kubernetes-manifests-with-helm-charts-using-kustomize-2f82ab5c5f11).

# Managing Secrets:
Child Argocd has further abilities to decrypt the secrets through following components.

> ##**SOPS** [doc*](https://github.com/getsops/sops)

>##**SOPS+GCP KMS** [doc*](https://www.middlewareinventory.com/blog/using-sops-with-aws-kms-encrypt-and-decrypt-files-devops-junction/)

>##**HELM+SOPS** [doc*](https://github.com/camptocamp/argocd-helm-sops-example)

>##**Kustomize+SOPS (KSOPS)** [doc*](https://github.com/goabout/kustomize-sopssecretgenerator)
