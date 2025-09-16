resource "talos_machine_secrets" "main" {
  #talos_version = var.talos_version_for_talos_nodes
}

resource "local_file" "all_machine_secrets_yaml" {
  content = yamlencode({
    cluster     = talos_machine_secrets.main.machine_secrets.cluster
    secrets     = talos_machine_secrets.main.machine_secrets.secrets
    trustdinfo  = talos_machine_secrets.main.machine_secrets.trustdinfo
    certs = {
      etcd                 = talos_machine_secrets.main.machine_secrets.certs.etcd
      k8s                  = talos_machine_secrets.main.machine_secrets.certs.k8s
      k8s_aggregator       = talos_machine_secrets.main.machine_secrets.certs.k8s_aggregator
      k8s_serviceaccount   = talos_machine_secrets.main.machine_secrets.certs.k8s_serviceaccount
      os                   = talos_machine_secrets.main.machine_secrets.certs.os
    }
  })
  filename        = "all_machine_secrets.yaml"
  file_permission = "0600"
}



#kubeconfig
resource "talos_cluster_kubeconfig" "main" {
  depends_on = [
    talos_machine_secrets.main
  ]
  client_configuration = talos_machine_secrets.main.client_configuration
  node                 = var.cluster_endpoint_and_ip_for_vip
}

resource "local_file" "kubeconfig" {
  content  = talos_cluster_kubeconfig.main.kubeconfig_raw 
  filename = "/root/.kube/config"
  file_permission = "0600"
}

#talosctl config
data "talos_client_configuration" "main" {
  depends_on = [
    talos_cluster_kubeconfig.main
  ]
  cluster_name         = var.cluster_name
  client_configuration = talos_machine_secrets.main.client_configuration
  nodes                = [var.cluster_endpoint_and_ip_for_vip]
  endpoints            = [var.cluster_endpoint_and_ip_for_vip]
}

resource "local_file" "talosctl_config" {
  content  = data.talos_client_configuration.main.talos_config
  filename = "/root/.talos/config"
  file_permission = "0600"
}

