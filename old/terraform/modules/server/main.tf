resource "google_compute_instance" "ansible_server" {
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
  connection {
    host        = google_compute_instance.ansible_server.network_interface[0].access_config[0].nat_ip
    type        = "ssh"
    user        = "loshakigor"
    agent       = false
    private_key = file("C:\\source\\infra\\key\\id_rsa")
  }
	provisioner "remote-exec" {
    inline = [
       "cd /tmp",
       "sudo mkdir config",
	   "sudo chown loshakigor config"
       
    ]
  }
  
	provisioner "file" {
    source      = var.filelist
    destination = "/tmp/config"
    }
	
	provisioner "file" {
		source      = var.private_ssh_key
		destination = "/tmp/config/id_rsa"
						}
	
	
	
	
      provisioner "remote-exec" {
        script = "./soft.sh"
        }
	   
	   
	   
  }




