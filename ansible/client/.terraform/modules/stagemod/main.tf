resource "google_compute_address" "app_ip" {
name = "reddit-app-ip"
}
resource "google_compute_instance" "app" {
  tags = ["reddit-app"]
  metadata = {
    sshKeys = "loshakigor:${file(var.ssh_key)}"
  }
  name         = "reddit-app"
  machine_type = "g1-small"
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
	nat_ip = google_compute_address.app_ip.address
	}
  }
  connection {
    host        = google_compute_instance.app.network_interface[0].access_config[0].nat_ip
    type        = "ssh"
    user        = "loshakigor"
    agent       = false
    private_key = file("C:\\source\\infra\\key\\id_rsa")
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с тегом …
  target_tags = ["reddit-app"]
}

