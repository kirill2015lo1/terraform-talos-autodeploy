terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.83.0"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.9.0" 
    }
  }
}

provider "proxmox" {
  endpoint = var.endpoint
  username = var.username
  password = var.password
  insecure = true
}

provider "talos" {}