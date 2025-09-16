# output node info
output "node_info" {
  depends_on = [module.talos]
  value       = module.node.node_info
  description = "Node info of node"
}
# output addresses
output "addresses" {
  depends_on = [module.talos]
  value       = var.addresses
  description = "Addresses of node"
}