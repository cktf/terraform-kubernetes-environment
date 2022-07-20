output "kubeconfig" {
  value = yamlencode({
    apiVersion = "v1"
    kind       = "Config"
    clusters = [{
      name = "default"
      cluster = {
        server                     = var.kubernetes_host
        certificate-authority-data = base64encode(var.kubernetes_ca_crt)
      }
    }]
    users = [{
      name = "default"
      user = {
        token = data.kubernetes_secret.this.data["token"]
      }
    }]
    contexts = [{
      name = "default"
      context = {
        cluster   = "default"
        user      = "default"
        namespace = data.kubernetes_secret.this.data["namespace"]
      }
    }]
    current-context = "default"
  })
  sensitive   = true
  description = "Kubernetes Environment Config"
}
