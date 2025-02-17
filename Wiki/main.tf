terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.75.1"
    }
  }
}

provider "ibm" {
  region = "eu-es"
  ibmcloud_api_key = var.api_key
}

resource "ibm_iam_access_group" "Stemdo_TEST" {
  name        = "Stemdo_TEST"
  description = "Resource group for IAM access for Wiki users"
}


# resource "ibm_iam_access_group_policy" "TestPolicy" {
#   access_group_id = "AccessGroupId-3c278dfb-5193-4ffc-95b3-e796f46a8187"
#   roles           = ["Editor","Viewer","Manager","Operator"]
  

#   resources {
#     service = "container-registry"
#     resource_group_id = var.resource_group
#   }
# }

# resource "ibm_iam_access_group_policy" "KubernetesPolicy" {
#   access_group_id = ibm_iam_access_group.Stemdo_TEST.id
#   roles           = ["Editor","Viewer","Manager","Operator"]
  

#   resources {
#     service = "container-registry"
#     resource_group_id = var.resource_group
#   }
#   depends_on = [ ibm_iam_access_group_policy.TestPolicy ]
# }



resource "ibm_iam_policy" "policy1" {
  name        = "CR Policy"
  description = "Allow Kubernetes admin access"
  roles       = ["Administrator"]  # Puedes cambiar esto por el rol adecuado, como 'Writer', 'Reader', etc.
  resources   = ["service:container-registry"]  # Especifica el servicio de Kubernetes
  subjects    = ["iam-access-group:${ibm_iam_access_group.Stemdo_TEST.id}"]  # Asignar al grupo de acceso
}
