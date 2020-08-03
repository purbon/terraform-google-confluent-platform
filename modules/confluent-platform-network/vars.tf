
variable "project" { }

variable "credentials_file" { }

variable "region" { }

variable "zone" { }

variable "zones" {
  type = list(string)
  default = []
  description = "Zones available in the selected region"
}

variable "name" {
  type = string
  #default = ""
}
