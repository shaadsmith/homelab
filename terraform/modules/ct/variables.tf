variable "ct_name" {}
variable "ct_template" {}
variable "ct_password" {
  sensitive = true
}
variable "ct_cores" {}
variable "ct_memory" {}
variable "ct_disk_size" {}
variable "node" {}
variable "storage" {}
variable "network_bridge" {}
