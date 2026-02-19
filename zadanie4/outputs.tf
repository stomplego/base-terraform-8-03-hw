output "web_vm_info" {
  value = {
    instance_name = yandex_compute_instance.platform.name
    external_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.platform.fqdn
  }
}

output "db_vm_info" {
  value = {
    instance_name = yandex_compute_instance.db.name
    external_ip   = yandex_compute_instance.db.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.db.fqdn
  }
}

output "web_external_ip" {
  value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
}

output "db_external_ip" {
  value = yandex_compute_instance.db.network_interface.0.nat_ip_address
}

output "web_ssh_command" {
  value = "ssh ubuntu@${yandex_compute_instance.platform.network_interface.0.nat_ip_address}"
}

output "db_ssh_command" {
  value = "ssh ubuntu@${yandex_compute_instance.db.network_interface.0.nat_ip_address}"
}
