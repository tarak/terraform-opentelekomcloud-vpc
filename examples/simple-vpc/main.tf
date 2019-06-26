provider "opentelekomcloud" {
  access_key  = var.access_key
  auth_url    = var.auth_url
  domain_name = var.domain_name
  secret_key  = var.secret_key
  tenant_name = var.tenant_name
  version     = "~> 1.9"
}

module "vpc" {
  source              = "../../"
  cidr                = "10.0.0.0/12"
  namespace           = "acme"
  nat_gateway_enabled = false
  stage               = "prod"
}
