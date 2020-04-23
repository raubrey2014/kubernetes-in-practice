## A real app

Deploying a real app to Digital Ocean.

Choose and configure a simple 3 node kubernetes cluster. Download the `kubeconfig` file and add the `users`, `clusters`, and `contexts` items to the respective arrays in each of the sections in your own `.kubeconfig` file. This will allow us to switch between a local setup and a production one.

```
$> kubectl port-forward deployments/hellok8s 4567

$> kubectl get pods -o wide
# shows node specific info, as our cluster is now truly split across nodes

$> kubectl get nodes -o wide
# This, crucially when using a simple NodePort service for external connection, will show external ips for the nodes
```

The ingress controller consistently referred to in this tutorial (and others) is no longer available at a simple raw.github link in a cloud agnostic manifest. Looks like the easiest way to get it is via the kubernetes package manager - `helm`.

```
$> brew install helm

$> helm repo add stable https://kubernetes-charts.storage.googleapis.com/
# where should helm look for packages?

$> helm search repo stable
# peek at what is available..

$> helm install nginx-ingress stable/nginx-ingress --set controller.publishService.enabled=true

$> kubectl apply -f simple-cluster-ip.yaml
$> kubectl apply -f simple-cluster-ip-for-nginx.yaml

$> kubectl apply -f ingress.yaml
$> sudo bash -c 'echo "IP_ADDRESS_FROM_INGRESS hello.do.com" >> /etc/hosts'
$> sudo bash -c 'echo "IP_ADDRESS_FROM_INGRESS nginx.do.com" >> /etc/hosts'

$> curl nginx.do.com
# nginx response...

$> curl hello.do.com
# rubytest response...

```
