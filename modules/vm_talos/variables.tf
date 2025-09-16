variable "machine_type" {
  description = "Machine type"
  type        = string
}

variable "cluster_endpoint_and_ip_for_vip" {
  description = "Interface for VIP and endpoint IP"
  type        = string
}

variable "node_name" {
  description = "Node name"
  type        = string
}

variable "name" {
  description = "Name of the virtual machine"
  type        = string
}


variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "disk_size" {
  description = "Disk size (e.g., '20G')"
  type        = number
}

variable "vm_id" {
  description = "VM ID for the virtual machine"
  type        = number
}

variable "memory_dedicated" {
  description = "Memory allocation in MB"
  type        = number
}


variable "addresses" {
  description = "Interface IP addresses"
  type        = string
}
 

variable "nodeLabels" {
  description = "Node labels"
  type        = map(string)
}

variable "machine_secrets" {
  description = "Machine secrets for Talos cluster"
  type        = any
}

variable "client_configuration" {
  description = "Client configuration for Talos cluster"
  type        = any
}


############### with default values ###############

variable "agent_enabled" {
  description = "Agent enabled"
  type        = bool
  default     = true
}

variable "bios" {
  description = "BIOS"
  type        = string
  default     = "seabios"

}

variable "cpu_type" {
  description = "CPU type"
  type        = string
  default     = "host"
}

variable "cpu_sockets" {
  description = "CPU sockets"
  type        = number
  default     = 1
}

variable "disk_backup" {
  description = "Disk backup"
  type        = bool
  default     = false
}

variable "disk_interface" {
  description = "Disk interface"
  type        = string
  default     = "scsi0"
}

variable "image" {
  description = "Image for Talos cluster"
  type        = string
  default     = "factory.talos.dev/metal-installer/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515:v1.11.0"
}

variable "inlineManifests" {
  description = "Inline manifests for Talos cluster"
  type        = list(object({
    name     = string
    contents = string
  }))
  default     = [
    {
      name     = "namespace-ci"
      contents = <<-EOT
        apiVersion: v1
        kind: Namespace
        metadata:
          name: ci
    EOT
    },
    {
      name     = "configmap-example"
      contents = <<-EOT
        apiVersion: v1
        kind: ConfigMap
        metadata:
          name: example-config
          namespace: ci
        data:
          test: va1232132132132123312312123lue
    EOT
    }
  ]
}

variable "nodeTaints" {
  description = "Node taints"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Environment"
  type        = map(string)
  default     = {}
}

variable "time_servers" {
  description = "Time servers"
  type        = list(string)
  default     = [
    "1.ru.pool.ntp.org",
    "2.ru.pool.ntp.org",
    "3.ru.pool.ntp.org"
  ]
}

variable "logging_endpoint" {
  description = "Logging endpoint"
  type        = string
  default     = "tcp://127.0.0.1:514"
}

variable "logging_format" {
  description = "Logging format"
  type        = string
  default     = "json_lines"
}

variable "disk" {
  description = "Disk name for install talos"
  type        = string
  default     = "/dev/sda"
}

variable "extraManifests" {
  description = "Extra manifests"
  type        = list(string)
  default     = ["https://raw.githubusercontent.com/argoproj/argo-cd/master/manifests/ha/install.yaml"]
}



variable "searchDomains" {
  description = "Search domains"
  type        = list(string)
  default     = ["tsuran.local"]
}



variable "disk_datastore_id" {
  description = "Storage pool for the disk"
  type        = string
  default     = "local-zfs"
}

variable "network_bridge" {
  description = "Network bridge to use"
  type        = string
  default     = "vmbr1"
}


variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default = "tsuran-cluster"
}

variable "interface" {
  description = "Interface name for configs"
  type        = string
  default     = "ens18"
}

variable "gateway" {
  description = "Interface gateway"
  type        = string
  default     = "192.168.100.1"
}


variable "nameservers" {
  description = "Domain nameservers"
  type        = list(string)
  default     = ["192.168.100.240", "192.168.0.240", "8.8.8.8", "1.1.1.1"]  
}  


variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.31.4"
}
