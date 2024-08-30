terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "vault" {
  address = "http://0.0.0.0:8200"
  token = var.root_token
}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = data.vault_aws_static_access_credentials.creds.access_key
  secret_key = data.vault_aws_static_access_credentials.creds.secret_key
  alias      = "singapore-vpc"
}

provider "aws" {
  region     = "ap-northeast-1"
  access_key = data.vault_aws_static_access_credentials.creds.access_key
  secret_key = data.vault_aws_static_access_credentials.creds.secret_key
  alias      = "japan-vpc"
}

data "vault_aws_static_access_credentials" "creds" {
  backend = "aws-vault-admin-account"
  name    = "vpc-static-role"
}
