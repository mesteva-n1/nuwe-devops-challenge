resource "kubernetes_resource_quota" "quota_devops_challenge" {
  metadata {
    name = "${local.deploy_name}-resource-quota"
    namespace = local.namespace
  }

  spec {
    hard = {
      "requests.cpu"           = "100m"
      "requests.memory"        = "200Mi"
      "limits.cpu"             = "850m"
      "limits.memory"          = "750Mi"
    }
  }
  depends_on = [
    kubernetes_namespace.namespace_devops_challenge
  ]
}