//variable "ibmcloud_api_key" {}

provider "ibm" {
  ibmcloud_api_key   = var.ibmcloud_api_key
  generation         = 2
  region             = "us-south"
}

# output "debug_ibmcloud_api_key" {
#   value     = var.ibmcloud_api_key
#   sensitive = false  # Caution: not recommended for secrets
# }
