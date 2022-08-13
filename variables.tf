variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Kubernetes Environment Name"
}

variable "host" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Kubernetes Cluster Host"
}

variable "ca_crt" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Kubernetes Cluster CA Certificate"
}

variable "registry" {
  type = object({
    endpoint = string
    username = string
    password = string
  })
  default     = null
  sensitive   = false
  description = "Kubernetes Registry Credentials"
}
