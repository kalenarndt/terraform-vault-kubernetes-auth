output "vault_kubernetes_auth_mount" {
  value       = vault_auth_backend.kubernetes
  description = "Output that contains the entire resource block for the kubernetes auth mount"
}

output "vault_kubernetes_auth_config" {
  value       = vault_kubernetes_auth_backend_config.kubernetes
  description = "Output that contains the entire resource block for the Kubernetes auth mount configuration"
}
