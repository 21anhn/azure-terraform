output "vnet1_subnet_id" {
  value = module.vnet1.subnet_id
  description = "The ID of the subnet created in VNet1"
}

output "vnet2_subnet_id" {
  value = module.vnet2.subnet_id
  description = "The ID of the subnet created in VNet1"
}
