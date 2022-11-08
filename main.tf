data "kubernetes_service_account" "vault" {
  metadata {
    name      = var.vault_svc_account_name
    namespace = var.vault_k8s_namespace
  }
}

data "kubernetes_secret" "vault" {
  metadata {
    name      = data.kubernetes_service_account.vault.default_secret_name
    namespace = var.vault_k8s_namespace
  }
}

resource "vault_auth_backend" "kubernetes" {
  namespace = var.vault_namespace
  path      = var.vault_auth_path
  type      = var.vault_auth_type
  tune {
    max_lease_ttl     = var.max_lease_ttl
    default_lease_ttl = var.default_lease_ttl
  }
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  namespace              = var.vault_namespace
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = var.kubernetes_api_url
  kubernetes_ca_cert     = data.kubernetes_secret.vault.data["ca.crt"]
  token_reviewer_jwt     = data.kubernetes_secret.vault.data.token
  disable_local_ca_jwt   = true
  disable_iss_validation = true
}
