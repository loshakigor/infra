provider "google" {
  project = var.project
  region      = "europe-west1"
  credentials = file("C:\\source\\infra\\key\\infra.json")
}


 
module "prodmod1" {
source = "C:\\source\\infra\\terraform\\modules\\client"
ssh_key = var.ssh_key
disk_image = "ubuntu-1910-eoan-v20200331"
host = "ubuntu1"
ipname = "ip1"
}
module "prodmod2" {
source = "C:\\source\\infra\\terraform\\modules\\client"
ssh_key = var.ssh_key
disk_image = "ubuntu-1910-eoan-v20200331"
host = "ubuntu2"
ipname = "ip2"
}




#module "servmod" {
#source = "C:\\source\\infra\\terraform\\modules\\server"
#ssh_key = var.ssh_key
#disk_image = "centos-7-v20200309"
#host = "server"
#filelist = "C:/source/infra/terraform/modules/server/config/"
#private_ssh_key = var.private_ssh_key
#}



   
	

	