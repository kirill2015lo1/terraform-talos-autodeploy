resource "talos_machine_bootstrap" "main" {
  depends_on = [
    module.master1
  ]
  node                 = split("/", module.master1.addresses)[0]
  client_configuration = talos_machine_secrets.main.client_configuration
}
