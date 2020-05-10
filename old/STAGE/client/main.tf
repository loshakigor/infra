provider "google" {
  project     = var.project
  region      = "europe-west1"
  credentials = file("C:\\source\\infra\\key\\infra.json")
}



module "prodmod1" {
  source     = "C:\\source\\infra\\STAGE\\module\\client"
  ssh_key    = var.ssh_key
  disk_image = "ubuntu-1910-eoan-v20200331"
  host       = "ubuntu1"

}
module "prodmod2" {
  source     = "C:\\source\\infra\\STAGE\\module\\client"
  ssh_key    = var.ssh_key
  disk_image = "ubuntu-1910-eoan-v20200331"
  host       = "ubuntu2"

}
