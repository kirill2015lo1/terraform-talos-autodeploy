module "master1" {
  #create vm
  source                    = "./modules/vm_talos"
  node_name                  = "proxserver1"
  name                      = "master1"
  vm_id                     = 110
  memory_dedicated          = 4096
  cpu_cores                 = 1
  disk_size                 = 20

  #config for talos 
  machine_type                  = "controlplane"
  addresses                     = "192.168.100.110/24"  
  nodeLabels = {
    "lol.kek" = "test-master1"
  }

  #vars that same for all talos nodes
  machine_secrets                 = talos_machine_secrets.main.machine_secrets
  client_configuration            = talos_machine_secrets.main.client_configuration
  cluster_name                    = var.cluster_name
  cluster_endpoint_and_ip_for_vip = var.cluster_endpoint_and_ip_for_vip
}




module "master2" {
  #create vm
  source                    = "./modules/vm_talos"
  node_name                  = "proxserver1"
  name                      = "master2"
  vm_id                     = 111
  memory_dedicated          = 4096
  cpu_cores                 = 1
  disk_size                 = 20

  #config for talos 
  machine_type                  = "controlplane"
  addresses                     = "192.168.100.111/24"  
  nodeLabels = {
    "lol.kek" = "test-master2"
  }

  #vars that same for all talos nodes
  machine_secrets                 = talos_machine_secrets.main.machine_secrets
  client_configuration            = talos_machine_secrets.main.client_configuration
  cluster_name                    = var.cluster_name
  cluster_endpoint_and_ip_for_vip = var.cluster_endpoint_and_ip_for_vip
}

module "master3" {
  #create vm
  source                    = "./modules/vm_talos"
  node_name                  = "proxserver1"
  name                      = "master3"
  vm_id                     = 112
  memory_dedicated          = 4096
  cpu_cores                 = 1
  disk_size                 = 20

  #config for talos 
  machine_type                  = "controlplane"
  addresses                     = "192.168.100.112/24"  
  nodeLabels = {
    "lol.kek" = "test-master3"
  }

  #vars that same for all talos nodes
  machine_secrets                 = talos_machine_secrets.main.machine_secrets
  client_configuration            = talos_machine_secrets.main.client_configuration
  cluster_name                    = var.cluster_name
  cluster_endpoint_and_ip_for_vip = var.cluster_endpoint_and_ip_for_vip
}
