resource "kubernetes_resource_quota" "this" {
  count      = length(keys(var.quota)) > 0 ? 1 : 0
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "default"
    namespace = var.name
  }

  spec {
    hard = var.quota
  }
}
