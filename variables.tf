variable "username" {
  description = "Proxmox user"
  type        = string
}

variable "password" {
  description = "Proxmox password"
  type        = string
} 

variable "endpoint" {
  description = "Proxmox API URL"
  type        = string
}

variable "cluster_endpoint_and_ip_for_vip" {
  description = "Cluster endpoint and IP for VIP"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}