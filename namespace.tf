resource "kubernetes_namespace" "this" {
  metadata {
    name = var.name
  }
}

resource "kubernetes_secret" "regcred" {
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "regcred"
    namespace = var.name
  }

  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = jsonencode({
      "auths" : {
        "${try(var.registry.endpoint, "")}" : {
          "auth" : base64encode("${try(var.registry.username, "")}:${try(var.registry.password, "")}")
        }
      }
    })
  }
}
