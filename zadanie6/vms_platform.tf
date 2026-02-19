### VM resources configuration
variable "vms_resources" {
  description = "Resources configuration for VMs"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
    platform_id   = string
    zone          = string
    preemptible   = bool
    nat           = bool
  }))
  default = {
    web = {
      cores         = 2
      memory        = 4
      core_fraction = 20
      disk_size     = 20
      disk_type     = "network-hdd"
      platform_id   = "standard-v3"
      zone          = "ru-central1-a"
      preemptible   = true
      nat           = true
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 20
      disk_type     = "network-hdd"
      platform_id   = "standard-v3"
      zone          = "ru-central1-b"
      preemptible   = true
      nat           = true
    }
  }
}

### Common metadata for all VMs
variable "metadata" {
  description = "Common metadata for all VMs"
  type = map(string)
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4axl0229XBuXTl4/CW6syldFpZ4Xk2UkW7G/lX0hzC ubuntu"
  }
}

# Оставляем только переменные для формирования имен
variable "vm_web_name_prefix" { type = string, default = "develop" }
variable "vm_web_env" { type = string, default = "platform" }
variable "vm_web_role" { type = string, default = "web" }
variable "vm_db_name_prefix" { type = string, default = "develop" }
variable "vm_db_env" { type = string, default = "platform" }
variable "vm_db_role" { type = string, default = "db" }

# ВСЕ остальные переменные (vm_web_cores, vm_db_memory и т.д.) - удалены
