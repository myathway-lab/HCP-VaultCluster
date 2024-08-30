#output "singapore-vpc" {
#  value = data.aws_vpc.singapore-vpc
#}


output "japan-vpc" {

  value = data.aws_vpc.japan-vpc

}

output "my-statuc-role-creds" {
  value     = data.vault_aws_static_access_credentials.creds
  sensitive = true
}

