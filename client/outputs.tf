output "prod1ip" {
  value = module.prodmod1.ansible_external_ip
}
output "prod2ip" {
  value = module.prodmod2.ansible_external_ip
}
