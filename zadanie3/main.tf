# Первая ВМ
resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  zone        = var.vm_web_zone
  # ... остальные параметры
}

# Вторая ВМ
resource "yandex_compute_instance" "db" {
  name        = var.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone

  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vm_db_disk_size
      type     = var.vm_db_disk_type
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = var.vm_db_nat
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: ubuntu
          ssh-authorized-keys:
            - ${var.vms_ssh_root_key}
          sudo: ['ALL=(ALL) NOPASSWD:ALL']
          groups: sudo
          shell: /bin/bash
      package_update: true
      packages:
        - curl
        - htop
    EOF
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
}

# Вторая подсеть
resource "yandex_vpc_subnet" "develop_b" {
  name           = "${var.vpc_name}-b"
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_b
}
