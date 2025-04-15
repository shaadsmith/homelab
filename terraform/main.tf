terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">= 2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure = true  # Flip this to false if you’ve got valid SSL certs
}


module "vm_instance" {
  source = "./modules/vm"

  vm_name         = var.vm_name
  node            = var.node
  template        = var.vm_template
  cores           = var.vm_cores
  memory          = var.vm_memory
  disk_size       = var.vm_disk_size
  storage         = var.storage
  network_bridge  = var.network_bridge
}

module "ct_instance" {
  source = "./modules/ct"

  ct_name         = var.ct_name
  node            = var.node
  template        = var.ct_template
  cores           = var.ct_cores
  memory          = var.ct_memory
  disk_size       = var.ct_disk_size
  storage         = var.storage
  network_bridge  = var.network_bridge
}
