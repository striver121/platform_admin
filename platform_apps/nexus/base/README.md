# Installation Helm Chart

Reference:

https://artifacthub.io/packages/helm/sonatype/nexus-repository-manager?modal=install

helm repo add sonatype https://sonatype.github.io/helm3-charts/
helm install my-nexus-repository-manager sonatype/nexus-repository-manager --version 61.0.2
