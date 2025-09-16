terraform {
  required_providers {
    talos = {
      source  = "siderolabs/talos"
      version = "0.9.0" 
    }
  }
}



data "talos_machine_configuration" "node" {
  cluster_name       = var.cluster_name
  machine_type       = var.machine_type
  cluster_endpoint   = var.cluster_endpoint
  machine_secrets    = var.machine_secrets
  kubernetes_version = var.kubernetes_version
  config_patches = [
    yamlencode({
      machine = {
        install = {
          disk = var.disk
          image = var.image
        }
        network = {
          interfaces = [
            {
              interface = var.interface
              addresses = [var.addresses]
              routes = [
                {
                  network = "0.0.0.0/0"
                  gateway = var.gateway
                }
              ]
              vip = var.machine_type == "controlplane" ? {
                ip = var.vip_ip
              } : null
            }
          ]
          nameservers = var.nameservers
          searchDomains = var.searchDomains
        }
        nodeLabels = var.nodeLabels
        nodeTaints = var.nodeTaints
        env        = var.env
        time = {
          servers = var.time_servers
        } 
        logging    = {
          destinations = [{
            endpoint = var.logging_endpoint
            format = var.logging_format
          }]
        }
      }
      cluster = {
        extraManifests = var.extraManifests
        inlineManifests = var.inlineManifests
        adminKubeconfig = {
          certLifetime = "99999h"
        }
        apiServer = {
          admissionControl = [
            {
              name = "PodSecurity"
              configuration = {
                defaults = {
                  audit = "privileged"
                  "audit-version" = "latest"
                  enforce = "privileged"
                  "enforce-version" = "latest"
                  warn = "privileged"
                  "warn-version" = "latest"
                }
              }
            }
          ]
        }
      }
    })
  ]

}

resource "talos_machine_configuration_apply" "main" {
  client_configuration        = var.client_configuration
  machine_configuration_input = data.talos_machine_configuration.node.machine_configuration
  node                        = var.node
}