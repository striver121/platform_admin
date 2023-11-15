# Manage Argo CD using Argo CD!

Argocd managed by Argocd, let's call this topology as Master and Slave, where Master considered to be a basic vendor shipped installation and simply holds/points it's repository to one/many child Argocd as an application/s. These topology leads to Apps manage Apps.
> You can find more gets on information about **Argocd manages Argocd** [here](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup#manage-argo-cd-using-argo-cd).

These Child Argocd applications have customized based on your organization's needs and environment/s, also these reduces the management cost as this can be managed using CaC (Declarative GitOps) instead iAC where it watches the trigger for changes and also gives the ability to isolate the repositories. As ArgoCD watch/supports two hops of repos, i.e repo A calls repo B, if any changes happens in any repo Argocd can able to adopt those changes. In this repo example i have isolated repositories based on the organization needs. `Platform_Admin` manages purely Argocd Master, Argocd Childs and the Platform Apps which required to manage the kubernetes environment, on the other side `Platform_Devs`are more focused on applications related operations.
> App of Apps is an admin-only tool **Platform_Admins manges applications resources which points to Platform_Devs repo where application code reside and managed my Devs** [here](https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping/#app-of-apps-pattern).


### Argocd Master & Argocd Child:

After Deploying Argocd Master with Terraform or Helm, The master is pointed to a git repo called `argocd_kustomization` through a values.yaml where Master's argo-repo server reads the repo and spin up the Argocd Child application/s according to the CaC, the application/s defined using kustomization which have base (simply calling default Argocd from ArgoProj) and overlays (using base + completely custom child Argocd as per organization's requirements with custom image build who have the capabilities to read secrets (helm-sops) on the fly and can able to use GCP services).

### Master and Child Argocd Topology:
![Alt text](https://github.com/striver121/platform_admin/blob/master/Topology.jpg)
[Topology](https://github.com/striver121/platform_admin/blob/master/Topology.pdf)
