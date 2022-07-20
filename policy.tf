# resource "kubernetes_network_policy" "this" {
#   depends_on = [kubernetes_namespace.this]

#   metadata {
#     name      = "default"
#     namespace = var.name
#   }

#   spec {
#     policy_types = ["Ingress", "Egress"]

#     pod_selector {}

#     ingress {
#       dynamic "from" {
#         for_each = each.value.environment.ingress

#         content {
#           namespace_selector {
#             match_labels = {
#               name = from.value
#             }
#           }
#         }
#       }
#     }

#     egress {
#       dynamic "to" {
#         for_each = each.value.environment.egress

#         content {
#           namespace_selector {
#             match_labels = {
#               name = to.value
#             }
#           }
#         }
#       }
#     }
#   }
# }
