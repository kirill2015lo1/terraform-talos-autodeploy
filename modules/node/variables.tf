variable "node_name" {
  description = "Hypervisor name to create VMs on"
  type        = string
}

variable "vm_id" {
  description = "VM ID for the virtual machine"
  type        = number
}

variable "name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "memory_dedicated" {
  description = "Memory allocation in MB"
  type        = number
}

variable "tags" {
  description = "A list of tags for the virtual machine. This is only meta information. Note: Proxmox always sorts the VM tags."
  type        = list(string)
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "disk_size" {
  description = "Disk size (e.g., '20G')"
  type        = number
}

variable "disk_datastore_id" {
  description = "Storage pool for the disk"
  type        = string
  default     = "local-zfs"
}

variable "network_bridge" {
  description = "Network bridge to use"
  type        = string
}

variable "cpu_type" {
  description = "CPU type"
  type        = string
}

variable "cpu_sockets" {
  description = "Number of CPU sockets"
  type        = number
}

variable "bios" {
  description = "BIOS type"
  type        = string
}

variable "disk_backup" {
  description = "Disk backup"
  type        = bool
}

variable "disk_interface" {
  description = "Disk interface"
  type        = string
}

variable "agent_enabled" {
  description = "Qemu guest agent enabled"
  type        = bool
}

