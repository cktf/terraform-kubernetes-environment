resource "kubernetes_resource_quota" "this" {
  count      = can(var.quota) ? 1 : 0
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "default"
    namespace = var.name
  }

  spec {
    hard = try(var.quota, {})
  }
}
