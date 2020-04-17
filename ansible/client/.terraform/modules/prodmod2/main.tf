resource "google_compute_address" "ip" {
name = var.ipname
address_type = "EXTERNAL"
}

resource "google_compute_instance" "ansible_client" {
  depends_on = [google_compute_address.ip]
  tags = [var.host]
  metadata = {
    sshKeys = "loshakigor:${file(var.ssh_key)}"
  }
  name         = var.host
  machine_type = "f1-micro"
  zone         = "europe-west1-b"
  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {
	nat_ip = google_compute_address.ip.address
	}
  }
  }
resource "google_compute_firewall" "firewall_http" {
  name = var.host
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  # Каким адресам разрешаем доступ
  target_tags = [var.host]
}
