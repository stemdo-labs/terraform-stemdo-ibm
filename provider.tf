provider "ibm" {
  # ibmcloud_api_key = var.ibmcloud_api_key # comment out and remove variable for schematics runs
  region           = "eu-es-1"
  ibmcloud_timeout = 60
}

# variable "ibmcloud_api_key" {}

# output "debug_ibmcloud_api_key" {
#   value     = var.ibmcloud_api_key
#   sensitive = false  # Caution: not recommended for secrets
# }
