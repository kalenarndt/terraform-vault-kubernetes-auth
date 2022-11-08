terraform {
  required_version = ">=1.3.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">=2.22.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.13.1"
    }
  }
}
