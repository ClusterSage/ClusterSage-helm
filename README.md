# ClusterSage Helm

This folder is prepared to become the standalone `ClusterSage-helm` repository.

## Charts

- `charts/clustersage`: umbrella platform chart for frontend, platform API, email worker, migration job, config, secrets, Gateway API Gateway, and HTTPRoutes.
- `charts/clusterwatch-agent`: customer-installed collector and Fluent Bit chart. The chart keeps the historical internal `clusterwatch-agent` name for compatibility.

## Validation

```bash
helm lint ./charts/clustersage
helm template clustersage-dev ./charts/clustersage -n clustersage -f ./charts/clustersage/values-dev.yaml
helm template clustersage-staging ./charts/clustersage -n clustersage -f ./charts/clustersage/values-staging.yaml
helm template clustersage-prod ./charts/clustersage -n clustersage -f ./charts/clustersage/values-prod.yaml
helm lint ./charts/clusterwatch-agent -f ./charts/clusterwatch-agent/values.customer.example.yaml
helm template clusterwatch-agent ./charts/clusterwatch-agent -n clusterwatch-agent -f ./charts/clusterwatch-agent/values.customer.example.yaml
```

Application deployment is owned by ArgoCD/GitOps. Terraform must not deploy this chart directly.
