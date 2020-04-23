## Understanding the kubconfig file

Every time `kubectl` is run, a `kubeconfig` file is referenced to understand how to communicate to our cluster. The default file is `~/.kube/config`.

A point of confusion in the tutorials was I was running a `minikube` cluster, the examples all assumed a Docker for Desktop setup. This is more clear when investigating this config file (and when using `kubectl config current-context`)!


A `context` is a combination of a `user` and `cluster`, the three main components of a `kubconfig` file.

```
$> kubectl config current-context

$> kubectl config use-context production

$> kubectl get pods --context production

$> kubectl --kubeconfig="path/to/config" get pods
```
