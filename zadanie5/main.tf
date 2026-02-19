resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name  # вместо var.vm_web_name
  # ...
}

resource "yandex_compute_instance" "db" {
  name        = local.vm_db_name  # вместо var.vm_db_name
  # ...
}
