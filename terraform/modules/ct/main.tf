resource "proxmox_lxc" "ct" {
  hostname     = var.ct_name
  target_node  = var.node
  ostemplate   = var.ct_template
  password     = var.ct_password
  cores        = var.ct_cores
  memory       = var.ct_memory

  network {
    name = "eth0"
    bridge = var.network_bridge
    ip     = "dhcp"
  }

  rootfs {
    storage = var.storage
    size    = var.ct_disk_size
  }
}
