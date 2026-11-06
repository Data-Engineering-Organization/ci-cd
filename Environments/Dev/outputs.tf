output "ResourceGroup" {
  value = module.ResourceGroup.rg_name_out
}

output "StorageAccount" {
  value = module.StorageAccount.sa_name_out
}