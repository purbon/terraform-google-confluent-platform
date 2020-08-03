
variable "project" { }
variable "credentials_file" { }
variable "myip" { }
variable "name" { }
variable "ssh_pub_key" { }

variable "region" { }
variable "zone"   { }
variable "zones"  { }

variable "owner_name" {
  default = ""
}

variable "owner_email" {
  default = ""
}

variable "brokers" {
  type = number
  default = 3
}

variable "zookeepers" {
  type = number
  default = 5
}

variable "connects" {
  type = number
  default = 2
}

variable "schema-registrys" {
  type = number
  default = 2
}
