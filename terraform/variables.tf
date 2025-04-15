variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token secret"
  type        = string
  sensitive   = true
}

variable "node" {
  description = "Proxmox node name"
  type        = string
  default     = "squad0"
}

variable "storage" {
  type    = string
  default = "proxdata"
}

variable "network_bridge" {
  type    = string
  default = "vmbr0"
}

module "vm" {
  source        = "./modules/vm"
  vm_name       = "ubuntu-vm"
  vm_template   = "ubuntu-22.04-"
  vm_cores      = 4
  vm_memory     = 2048
  vm_disk_size  = "32G"
}

module "ct" {
  source         = "./modules/ct"
  ct_name        = "ubuntu-ct"
  ct_password    = var.ct_password
  ct_template    = "local:ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  ct_cores       = 2
  ct_memory      = 2048
  ct_disk_size   = "10G"
}