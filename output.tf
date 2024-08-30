output "hvn" {
  value = {
    id         = hcp_hvn.mt-hcp-hvn.id
    region     = hcp_hvn.mt-hcp-hvn.region
    cidr_block = hcp_hvn.mt-hcp-hvn.cidr_block
  }
  description = "HVN attributes"
}

output "vault_token" {
  value       = hcp_vault_cluster_admin_token.admin_token.token
  description = "HCP Vault Admin token"
  sensitive   = true
}