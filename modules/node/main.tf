terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.83.0"
    }
  }
}

resource "proxmox_virtual_environment_vm" "node" {
  node_name = var.node_name
  vm_id     = var.vm_id
  tags      = var.tags
  bios      = var.bios
  name      = var.name

  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = var.agent_enabled
  }

  cpu {
    cores   = var.cpu_cores
    type    = var.cpu_type
    sockets = var.cpu_sockets
  }

  memory {
    dedicated = var.memory_dedicated
  }

  disk {
    datastore_id = var.disk_datastore_id
    size         = var.disk_size
    interface    = var.disk_interface
    backup       = var.disk_backup
  }
  
  network_device {
    bridge = var.network_bridge
  }
}
