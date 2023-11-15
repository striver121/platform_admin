# Manage Argo CD using Argo CD!

Argocd managed by Argocd, let's call this topology as Master and Slave, where Master considered to be a basic vendor shipped installation and simply holds/points it's repository to one/many child Argocd as an application/s, these Child Argocd applications have customized based on your organization's needs and environment/s, also these reduces the management cost as this can be managed using CaC (Configuration as a Code) instead iAC where it watches the trigger for changes and also gives the ability to isolate the repositories. As ArgoCD watch/supports two hops of repos, i.e repo A calls repo B, if any changes happens in any repo Argocd can able to adopt those changes. In this repo example i have isolated repositories based on the organization needs. `Platform_Admin` manages purely Argocd Master, Argocd Childs and the Platform Apps which required to manage the kubernetes environment, on the other side `Platform_Devs`are more focused on applications related operations.
> You can find more gets on information about **Argocd manages Argocd** [here](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup#manage-argo-cd-using-argo-cd).


### Argocd Master:
