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

variable "quota" {
  type        = map(string)
  default     = null
  sensitive   = false
  description = "Kubernetes Environment Quota"
}

variable "ingress" {
  type        = list(string)
  default     = null
  sensitive   = false
  description = "Kubernetes Environment Ingress"
}

variable "egress" {
  type        = list(string)
  default     = null
  sensitive   = false
  description = "Kubernetes Environment Egress"
}
