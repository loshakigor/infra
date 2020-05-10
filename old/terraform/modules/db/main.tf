resource "google_compute_instance" "db" {

  tags = ["reddit-db"]
  metadata = {
    sshKeys = "loshakigor:${file(var.ssh_key)}"
  }
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {	}
  }
}


resource "google_compute_firewall" "firewall_db" {
name = "default-allow-db"
description ="ALLOW DB"
network = "default"
allow {
protocol = "tcp"
ports = ["27017"]
}
  # Правило применимо для инстансов с тегом …
  target_tags = ["reddit-db"]
  # порт будет доступен только для инстансов с тегом ...
  source_tags = ["reddit-app"]

}


