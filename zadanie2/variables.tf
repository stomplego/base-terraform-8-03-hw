### cloud vars
variable "cloud_id" { type = string }
variable "folder_id" { type = string }
variable "default_zone" { type = string, default = "ru-central1-a" }
variable "default_cidr" { type = list(string), default = ["10.0.1.0/24"] }
variable "vpc_name" { type = string, default = "develop" }

### ssh vars
variable "vms_ssh_root_key" { type = string }

### service account
variable "service_account_key_file" { type = string, default = "key.json" }

### image variables
variable "vm_web_image_family" { type = string, default = "ubuntu-2204-lts" }

### VM web variables
variable "vm_web_name" { type = string, default = "develop-platform" }
variable "vm_web_platform_id" { type = string, default = "standard-v3" }
variable "vm_web_zone" { type = string, default = "ru-central1-a" }
variable "vm_web_cores" { type = number, default = 2 }
variable "vm_web_memory" { type = number, default = 4 }
variable "vm_web_core_fraction" { type = number, default = 20 }
variable "vm_web_disk_size" { type = number, default = 20 }
variable "vm_web_disk_type" { type = string, default = "network-hdd" }
variable "vm_web_nat" { type = bool, default = true }
variable "vm_web_preemptible" { type = bool, default = true }

