resource "kubernetes_network_policy" "this" {
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "default"
    namespace = var.name
  }

  spec {
    policy_types = ["Ingress", "Egress"]

    pod_selector {}

    ingress {
      dynamic "from" {
        for_each = { for item in var.ingress : item => item }

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
        for_each = { for item in var.egress : item => item }

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
