

output "external_ip_address_apps" {
  value = yandex_compute_instance.app.0.network_interface.*.nat_ip_address
}
