resource "kubernetes_resource_quota" "this" {
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "default"
    namespace = var.name
  }

  spec {
    hard = var.quota
  }
}
