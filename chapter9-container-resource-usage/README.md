## Container Resource Usage
Pods have resource limits that can be set either through `resources` -> `limits` in their container spec, or through a new resource: `limitrange`.

Kubernetes will only schedule pods if requested resources do not overcommit the available resources.

```
$> kubectl describe nodes

$> kubectl describe pod <pod-name>

$> kubectl get limitranges
```


