resource "kubernetes_service_v1" "service_devops_challenge" {
  metadata {
    name = local.service_name
    namespace = local.namespace
    labels = {
      "app.kubernetes.io/name" = local.deploy_name
    }
  }

  spec {
    type = "ClusterIP"

    port {
      name = "svc-tcp-${local.port}"
      port = local.port
      protocol = "TCP"
      target_port = "port-tcp-${local.port}"
    }
    
    selector = {
      "app.kubernetes.io/name" = local.deploy_name
    }
  }
}