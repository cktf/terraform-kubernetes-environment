resource "kubernetes_secret" "this" {
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "default"
    namespace = var.name
  }

  type = "Opaque"
  data = var.secrets
}
