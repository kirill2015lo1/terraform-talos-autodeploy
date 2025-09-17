
output "node_info" {
  depends_on = [proxmox_virtual_environment_vm.node]
  value = {
    name = proxmox_virtual_environment_vm.node.name
    tags = proxmox_virtual_environment_vm.node.tags
    mac_address  = proxmox_virtual_environment_vm.node.network_device[0].mac_address
    ip_address   = proxmox_virtual_environment_vm.node.agent[0].enabled && proxmox_virtual_environment_vm.node.started && length(proxmox_virtual_environment_vm.node.ipv4_addresses) > 0 ? proxmox_virtual_environment_vm.node.ipv4_addresses[7][0] : null
    node_name = var.node_name
    cpu = proxmox_virtual_environment_vm.node.cpu[0].cores
    memory = proxmox_virtual_environment_vm.node.memory[0].dedicated
    disk = proxmox_virtual_environment_vm.node.disk[0].size
  } 
  description = "Node name, MAC and IP address"
}
