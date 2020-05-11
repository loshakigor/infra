provider "google" {
  project = var.project
  region      = "europe-west1"
  credentials = file("C:\\source\\infra\\key\\infra.json")
}

module "instance" {
source = "C:\\source\\infra\\terraform\\modules\\instance"
ssh_key = var.ssh_key
disk_image = var.disk_image
}




