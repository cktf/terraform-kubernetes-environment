resource "kubernetes_network_policy" "this" {
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "default"
    namespace = var.name
  }

  spec {
    policy_types = ["Ingress", "Egress"]

    pod_selector {}

    # Allow ingress,egress traffic for InternalNamespace
    ingress {
      from {
        pod_selector {}
      }
    }
    egress {
      to {
        pod_selector {}
      }
    }

    # Allow egress traffic for DNS
    egress {
      to {
        namespace_selector {}
        pod_selector {
          match_labels = {
            k8s-app = "kube-dns"
          }
        }
      }
      ports {
        port     = 53
        protocol = "UDP"
      }
    }

    # Allow egress traffic for Internet
    egress {
      to {
        ip_block {
          cidr = "0.0.0.0/0"
        }
      }
      ports {
        port = 443
      }
      ports {
        port = 80
      }
    }

    # Allow ingress traffic for Namespaces
    dynamic "ingress" {
      for_each = { for item in var.ingress : item => item }
      content {
        from {
          namespace_selector {
            match_labels = {
              "kubernetes.io/metadata.name" = ingress.value
            }
          }
        }
      }
    }

    # Allow egress traffic for Namespaces
    dynamic "egress" {
      for_each = { for item in var.egress : item => item }
      content {
        to {
          namespace_selector {
            match_labels = {
              "kubernetes.io/metadata.name" = egress.value
            }
          }
        }
      }
    }
  }
}
