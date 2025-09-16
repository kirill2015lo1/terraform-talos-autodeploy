module "worker1" {
  #create vm
  source                    = "./modules/vm_talos"
  node_name                  = "proxserver1"
  name                      = "worker1"
  vm_id                     = 120
  memory_dedicated          = 4096
  cpu_cores                 = 1
  disk_size                 = 20

  #config for talos 
  machine_type                  = "worker"
  addresses                     = "192.168.100.120/24"  
  nodeLabels = {
    "lol.kek" = "test-worker1"
  }

  #vars that same for all talos nodes
  machine_secrets                 = talos_machine_secrets.main.machine_secrets
  client_configuration            = talos_machine_secrets.main.client_configuration
  cluster_name                    = var.cluster_name
  cluster_endpoint_and_ip_for_vip = var.cluster_endpoint_and_ip_for_vip
}


module "worker2" {
  #create vm
  source                    = "./modules/vm_talos"
  node_name                  = "proxserver1"
  name                      = "worker2"
  vm_id                     = 121
  memory_dedicated          = 4096
  cpu_cores                 = 1
  disk_size                 = 20

  #config for talos 
  machine_type                  = "worker"
  addresses                     = "192.168.100.121/24"  
  nodeLabels = {
    "lol.kek" = "test-worker2"
  }

  #vars that same for all talos nodes
  machine_secrets                 = talos_machine_secrets.main.machine_secrets
  client_configuration            = talos_machine_secrets.main.client_configuration
  cluster_name                    = var.cluster_name
  cluster_endpoint_and_ip_for_vip = var.cluster_endpoint_and_ip_for_vip
}

module "worker3" {
  #create vm
  source                    = "./modules/vm_talos"
  node_name                  = "proxserver1"
  name                      = "worker3"
  vm_id                     = 122
  memory_dedicated          = 4096
  cpu_cores                 = 1
  disk_size                 = 20

  #config for talos 
  machine_type                  = "worker"
  addresses                     = "192.168.100.122/24"  
  nodeLabels = {
    "lol.kek" = "test-worker3"
  }

  #vars that same for all talos nodes
  machine_secrets                 = talos_machine_secrets.main.machine_secrets
  client_configuration            = talos_machine_secrets.main.client_configuration
  cluster_name                    = var.cluster_name
  cluster_endpoint_and_ip_for_vip = var.cluster_endpoint_and_ip_for_vip
}

module "worker4" {
  #create vm
  source                    = "./modules/vm_talos"
  node_name                  = "proxserver1"
  name                      = "worker4"
  vm_id                     = 123
  memory_dedicated          = 4096
  cpu_cores                 = 1
  disk_size                 = 20

  #config for talos 
  machine_type                  = "worker"
  addresses                     = "192.168.100.123/24"
  nodeLabels = {
    "lol.kek" = "test-worker4"
  }

  #vars that same for all talos nodes
  machine_secrets                 = talos_machine_secrets.main.machine_secrets
  client_configuration            = talos_machine_secrets.main.client_configuration
  cluster_name                    = var.cluster_name
  cluster_endpoint_and_ip_for_vip = var.cluster_endpoint_and_ip_for_vip
}
