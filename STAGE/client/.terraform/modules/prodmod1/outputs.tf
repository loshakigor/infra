output "ansible_external_ip" {
  value = "${google_compute_instance.ansible_client.network_interface[0].access_config[0].nat_ip}"
}
