variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Kubernetes Environment Name"
}

variable "registry" {
  type = object({
    endpoint = string
    username = string
    password = string
  })
  default     = null
  sensitive   = false
  description = "Kubernetes Environment Registry"
}

variable "secrets" {
  type        = map(map(string))
  default     = {}
  sensitive   = false
  description = "Kubernetes Environment Secrets"
}

variable "ingress" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Kubernetes Environment Ingress"
}

variable "egress" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Kubernetes Environment Egress"
}

variable "quota" {
  type        = map(string)
  default     = {}
  sensitive   = false
  description = "Kubernetes Environment Quota"
}
