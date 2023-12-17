#### Adding helm repo:
```sh
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm repo update
```

### Listing helm repo:
```sh
$ helm repo list
NAME            URL      
bitnami         https://charts.bitnami.com/bitnami 
```

### Searching latest logstash chart version:
```sh
# helm search repo logstash
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                                       
bitnami/logstash        1.0.2           7.10.1          Logstash is an open source, server-side data pr...
```

### Convert Helm templates to manifests as helm-template-output.yaml in order to use it as kustomize base:
```
$ helm template --values ./values.yaml --release-name logs --version "1.0.2" --include-crds bitnami/logstash > helm-template-output.yaml
```

#### values.yaml can be obtain from the git repo (https://github.com/bitnami/charts):
```sh
https://github.com/bitnami/charts/blob/master/bitnami/logstash/values-production.yaml
```
