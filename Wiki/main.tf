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

resource "ibm_iam_access_group_policy" "KubernetesPolicy" {
  access_group_id = ibm_iam_access_group.Stemdo_TEST.id
  roles           = ["Editor","Viewer","Manager","Operator"]
  

  resources {
    resource_type = "container-registry"
    resource_group_id = var.resource_group
  }
}




