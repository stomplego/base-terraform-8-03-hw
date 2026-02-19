### VM db variables
variable "vm_db_name" { type = string, default = "netology-develop-platform-db" }
variable "vm_db_platform_id" { type = string, default = "standard-v3" }
variable "vm_db_zone" { type = string, default = "ru-central1-b" }
variable "vm_db_cores" { type = number, default = 2 }
variable "vm_db_memory" { type = number, default = 2 }
variable "vm_db_core_fraction" { type = number, default = 20 }
variable "vm_db_disk_size" { type = number, default = 20 }
variable "vm_db_disk_type" { type = string, default = "network-hdd" }
variable "vm_db_nat" { type = bool, default = true }
variable "vm_db_preemptible" { type = bool, default = true }
variable "vm_db_image_family" { type = string, default = "ubuntu-2204-lts" }

# Вторая зона и подсеть
variable "default_zone_b" { type = string, default = "ru-central1-b" }
variable "default_cidr_b" { type = list(string), default = ["10.0.2.0/24"] }
