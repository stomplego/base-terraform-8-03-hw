resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vms_resources["web"].platform_id
  zone        = var.vms_resources["web"].zone

  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vms_resources["web"].disk_size
      type     = var.vms_resources["web"].disk_type
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vms_resources["web"].nat
  }

  metadata = var.metadata  # общая metadata

  scheduling_policy {
    preemptible = var.vms_resources["web"].preemptible
  }
}

# Аналогично для db ресурса
