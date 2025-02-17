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