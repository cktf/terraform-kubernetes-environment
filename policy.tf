resource "kubernetes_network_policy" "this" {
  count      = (can(var.ingress) || can(var.egress)) ? 1 : 0
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "default"
    namespace = var.name
  }

  spec {
    policy_types = [
      can(var.ingress) ? "Ingress" : null,
      can(var.egress) ? "Egress" : null
    ]

    pod_selector {}

    ingress {
      dynamic "from" {
        for_each = try(var.ingress, [])

        content {
          namespace_selector {
            match_labels = {
              "kubernetes.io/metadata.name" = from.value
            }
          }
        }
      }
    }

    egress {
      dynamic "to" {
        for_each = try(var.egress, [])

        content {
          namespace_selector {
            match_labels = {
              "kubernetes.io/metadata.name" = to.value
            }
          }
        }
      }
    }
  }
}
