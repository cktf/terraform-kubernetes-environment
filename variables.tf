variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Kubernetes Environment Name"
}

variable "registry_endpoint" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Kubernetes Environment Registry Endpoint"
}

variable "registry_username" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Kubernetes Environment Registry Username"
}

variable "registry_password" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Kubernetes Environment Registry Password"
}

variable "kubernetes_host" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Kubernetes Host"
}

variable "kubernetes_ca_crt" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Kubernetes CA Certificate"
}
