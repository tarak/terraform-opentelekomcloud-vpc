variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = []
}

variable "convert_case" {
  type        = bool
  default     = true
  description = "Convert fields to lower case"
}

variable "cidr" {
  type        = string
  default     = ""
  description = "The cidr block of the desired VPC"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

variable "gateway_ips" {
  type    = list(string)
  default = []
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "stage" {
  type        = string
  default     = ""
  description = "Stage, e.g. 'prod', 'staging', 'dev'"
}

variable "subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "subnets_dhcp_enable" {
  type        = list(string)
  description = "Specifies whether the DHCP function is enabled for the subnets"
  default = [
    true,
    true,
    true
  ]
}

variable "subnets_dns_list" {
  type        = list
  default     = []
  description = "A list of DNS servers to use for subnet"
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
