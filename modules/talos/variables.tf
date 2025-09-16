variable "interface" {
  description = "Network interface name for Talos nodes"
  type        = string
}

variable "addresses" {
  description = "IP address for master node"
  type        = string
}

variable "vip_ip" {
  description = "VIP address for master node (leave empty for worker nodes)"
  type        = string
} 

variable "gateway" {
  description = "Gateway IP address for master node"
  type        = string
}

variable "nameservers" {
  description = "Nameservers for master node"
  type        = list(string)
}

variable "nodeLabels" {
  description = "Labels for master node"
  type        = map(string)
}

variable "nodeTaints" {
  description = "Additional taints for master node (will be merged with Talos defaults)"
  type        = map(string)
}

variable "machine_type" {
  description = "Machine type for master node"
  type        = string
}

variable "cluster_endpoint" {
  description = "Cluster endpoint for master node"
  type        = string
}

variable "disk" {
  description = "Disk for master node"
  type        = string
}

variable "image" {
  description = "Install image for Talos nodes"
  type        = string
}
variable "searchDomains" {
  description = "Search domains for master node"
  type        = list(string)
}

variable "extraManifests" {
  description = "Extra manifests for master node"
  type        = list(string)
}

variable "inlineManifests" {
  description = "Inline Kubernetes manifests for Talos cluster"
  type = list(object({
    name     = string
    contents = string
  }))
}

variable "kubernetes_version" {
  description = "Kubernetes version for master node"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name for master node"
  type        = string
}
  
variable "node" {
  description = "Node name for master node"
  type        = string
}

variable "machine_secrets" {
  description = "Machine secrets for Talos cluster"
  type        = any
}

variable "client_configuration" {
  description = "Client configuration for Talos cluster"
  type        = any
}

variable "env" {
  description = "Environment variables for the machine"
  type        = map(string)
}

variable "time_servers" {
  description = "NTP time servers for the machine"
  type        = list(string)
}

variable "logging_endpoint" {
  description = "Logging endpoint for the machine"
  type        = string
}

variable "logging_format" {
  description = "Logging format for the machine"
  type        = string
}

