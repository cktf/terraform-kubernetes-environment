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
        "${var.registry_endpoint}" : {
          "auth" : base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }
}

resource "kubernetes_service_account" "this" {
  depends_on = [kubernetes_namespace.this]

  metadata {
    name      = "admin"
    namespace = var.name
  }
}

resource "kubernetes_role_binding" "this" {
  depends_on = [kubernetes_service_account.this]

  metadata {
    name      = "admin"
    namespace = var.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "edit"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "admin"
    namespace = var.name
  }
}

data "kubernetes_secret" "this" {
  depends_on = [kubernetes_service_account.this]

  metadata {
    name      = kubernetes_service_account.this.default_secret_name
    namespace = var.name
  }
}
