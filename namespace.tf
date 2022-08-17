resource "kubernetes_namespace" "this" {
  metadata {
    name = var.name
  }
}

resource "kubernetes_secret" "this" {
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "regcred"
    namespace = var.name
  }

  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = jsonencode({
      "auths" : {
        "${coalesce(var.registry.endpoint, "")}" : {
          "auth" : base64encode("${coalesce(var.registry.username, "")}:${coalesce(var.registry.password, "")}")
        }
      }
    })
  }
}
