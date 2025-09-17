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

# create node
module "node" {
  source            = "../node"
  node_name         = var.node_name
  name              = var.name
  vm_id             = var.vm_id
  memory_dedicated  = var.memory_dedicated
  cpu_cores         = var.cpu_cores
  disk_size         = var.disk_size
  disk_datastore_id = var.disk_datastore_id
  network_bridge    = var.network_bridge
  tags              = [var.machine_type]
  agent_enabled     = var.agent_enabled
  bios              = var.bios
  cpu_type          = var.cpu_type
  cpu_sockets       = var.cpu_sockets
  disk_backup       = var.disk_backup
  disk_interface    = var.disk_interface
  stop_on_destroy   = var.stop_on_destroy
}

# create talos config and apply it
module "talos" {
  depends_on           = [module.node]
  source               = "../talos"
  cluster_name         = var.cluster_name
  machine_type         = var.machine_type
  cluster_endpoint     = "https://${var.cluster_endpoint_and_ip_for_vip}:6443"
  vip_ip               = var.cluster_endpoint_and_ip_for_vip
  kubernetes_version   = var.kubernetes_version
  disk                 = var.disk
  interface            = var.interface
  addresses            = var.addresses
  gateway              = var.gateway
  nameservers          = var.nameservers
  nodeLabels           = var.nodeLabels
  extraManifests       = var.extraManifests
  node                 = module.node.node_info.ip_address
  searchDomains        = var.searchDomains
  machine_secrets      = var.machine_secrets
  client_configuration = var.client_configuration
  image                = var.image
  inlineManifests      = var.inlineManifests
  nodeTaints           = var.nodeTaints
  env                  = var.env
  time_servers         = var.time_servers
  logging_endpoint     = var.logging_endpoint
  logging_format       = var.logging_format
}

