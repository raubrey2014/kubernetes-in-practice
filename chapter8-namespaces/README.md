## Namespaces

```
$> kubectl apply -f namespace.yaml

$> kubectl get namespaces

$> kubectl get pods --all-namespaces
$> kubectl get pods -n my-namespace

$> kubectl get all --all-namespaces

$> kubectl apply -f example-pod.yaml -n my-namespace

$> kubectl exec -it hellok8s -n my-namespace sh
```
