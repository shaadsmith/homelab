resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  target_node = var.node
  clone       = var.vm_template
  full_clone = true

  cpu    = var.vm_cores
  memory = var.vm_memory

  network {
    model  = "virtio"
    bridge = var.network_bridge
  }

  disk {
    size    = var.vm_disk_size
    type    = "scsi"
    storage = var.storage
  }
}
