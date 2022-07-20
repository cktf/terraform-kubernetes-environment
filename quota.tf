# resource "kubernetes_resource_quota" "this" {
#   depends_on = [kubernetes_namespace.this]

#   metadata {
#     name      = "default"
#     namespace = var.name
#   }

#   spec {
#     hard = {
#       "cpu"               = each.value.project.quota.cpu
#       "memory"            = each.value.project.quota.ram
#       "ephemeral-storage" = each.value.project.quota.hdd
#     }
#   }
# }
