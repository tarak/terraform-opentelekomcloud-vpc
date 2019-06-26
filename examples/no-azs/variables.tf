variable "access_key" {
  type        = string
  description = "Your OTC access key."
}

variable "auth_url" {
  type        = string
  default     = "https://iam.eu-de.otc.t-systems.com/v3"
  description = "URL of the authentication service (IAM)."
}

variable "domain_name" {
  type        = string
  description = "Name of your OTC domain."
}

variable "secret_key" {
  type        = string
  description = "Your OTC secret key."
}

variable "tenant_name" {
  type        = string
  default     = "eu-de"
  description = "Name of your OTC tenant / project."
}
