provider "google" {
  project = var.project
  region      = "europe-west1"
  credentials = file("C:\\source\\infra\\key\\infra.json")
}

module "app" {
source = "C:\\source\\infra\\terraform\\modules\\app"
ssh_key = var.ssh_key
app_disk_image = var.app_disk_image
}
module "db" {
source = "C:\\source\\infra\\terraform\\modules\\db"
ssh_key = var.ssh_key
db_disk_image = var.db_disk_image
}
module "vpc" {
source = "C:\\source\\infra\\terraform\\modules\\vpc"
source_ranges = ["212.90.53.127/32"]
}



