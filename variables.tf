variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes for the VPC label (e.g. `1`)."
}

variable "availability_zones" {
  description = "A list of availability zones of the Open Telekon Cloud region."
  default     = []
  type        = list(string)
}

variable "convert_case" {
  type        = bool
  default     = true
  description = "Convert the VPC label fields to lower case."
}

variable "cidr" {
  type        = string
  description = "The CIDR block of the desired VPC."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "gateway_ips" {
  type = list(string)
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'."
}

variable "nat_gateway_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any NAT gateway resources."
}

variable "nat_gateway_pool" {
  type        = string
  default     = "admin_external_net"
  description = "The name of the pool from which to obtain the floating IP for the NAT Gateway."
}

variable "nat_gateway_spec" {
  type        = string
  default     = "3"
  description = "The specification of the nat gateway, valid values are 1, 2, 3 or 4."
}

variable "stage" {
  type        = string
  default     = ""
  description = "Stage for the VPC label, e.g. 'prod', 'staging', 'dev'"
}

variable "subnets" {
  description = "A list of subnets inside the VPC."
  type        = list(string)
}

variable "subnets_dhcp_enable" {
  type        = list(bool)
  description = "Specifies whether the DHCP function is enabled for the subnets."
  default = [
    true,
    true,
    true
  ]
}

variable "subnets_dns_list" {
  type        = list(list(string))
  default     = []
  description = "A list of DNS servers to use for the subnets."
}

variable "subnets_primary_dns" {
  type        = list(string)
  default     = []
  description = "A list of IP addresses of DNS server 1 on the subnets"
}

variable "subnets_secondary_dns" {
  type        = list(string)
  default     = []
  description = "A list of IP addresses of DNS server 2 on the subnet"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}
