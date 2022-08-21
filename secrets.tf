resource "kubernetes_secret" "this" {
  depends_on = [kubernetes_namespace.this]
  for_each   = var.secrets

  metadata {
    name      = each.key
    namespace = var.name
  }

  type = "Opaque"
  data = each.value
}
