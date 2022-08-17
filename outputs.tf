output "namespace" {
  depends_on = [kubernetes_namespace.this]

  value       = var.name
  sensitive   = false
  description = "Kubernetes Environment Namespace"
}
