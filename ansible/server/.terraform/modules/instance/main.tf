resource "google_compute_instance" "ansible" {
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
    access_config {}
  }
  
  }
	
	