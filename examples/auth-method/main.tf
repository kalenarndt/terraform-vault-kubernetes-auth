module "vault-kubernetes-auth" {
  source = "../../"

  vault_svc_account_name = module.vault-injector-helm.vault_svc_account_name
  vault_k8s_namespace    = module.vault-injector-helm.vault_k8s_namespace
  kubernetes_api_url     = "https://myk8sapi"
  vault_namespace        = "admin"
}

module "vault-injector-helm" {
  source        = "kalenarndt/vault-external-helm-setup/kubernetes"
  version       = "~>0.0.1"
  vault_values  = "./templates/vault-eks.hcl.tfpl"
  vault_addr    = "some-external-addr"
  vault_version = "v1.12.0"
}
