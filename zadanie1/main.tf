terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_compute_instance" "platform" {
  name        = "develop-platform"
  platform_id = "standard-v3"
  zone        = var.default_zone

  core_fraction = 5  # ОШИБКА: вне блока resources

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    user-data = "${var.vms_ssh_public_root_key}"  # ОШИБКА: неверное имя переменной
  }

  scheduling_policy {
    preemptible = true
  }
}

output "external_ip" {
  value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
}
