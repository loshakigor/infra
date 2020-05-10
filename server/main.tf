provider "google" {
  project     = var.project
  region      = "europe-west1"
  credentials = file("C:\\source\\infra\\key\\infra.json")
}



module "servmod" {
  source          = "C:\\source\\infra\\module\\server"
  ssh_key         = var.ssh_key
  disk_image      = "centos-7-v20200309"
  host            = "server"
  filelist        = "C:/source/infra/module/server/config/"
  private_ssh_key = var.private_ssh_key
}
