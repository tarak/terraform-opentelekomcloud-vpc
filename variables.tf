variable "attributes" {
  type    = list(string)
  default = []
}

variable "availability_zones" {
  type = list(string)
}

variable "convert_case" {
  type    = bool
  default = true
}

variable "cidr" {
  type = string
}

variable "delimiter" {
  type    = string
  default = "-"
}

variable "enabled" {
  type    = bool
  default = true
}

variable "gateway_ips" {
  type = list(string)
}

variable "namespace" {
  type    = string
  default = ""
}

variable "nat_gateway_enabled" {
  type    = bool
  default = true
}

variable "nat_gateway_pool" {
  type    = string
  default = "admin_external_net"
}

variable "nat_gateway_spec" {
  type    = string
  default = "3"
}

variable "stage" {
  type    = string
  default = ""
}

variable "subnets" {
  type = list(string)
}

variable "subnets_dhcp_enable" {
  type = list(bool)
  default = [
    true,
    true,
    true
  ]
}

variable "subnets_dns_list" {
  type    = list
  default = []
}

variable "subnets_primary_dns" {
  type    = list(string)
  default = []
}

variable "subnets_secondary_dns" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
