
variable "project" { }

variable "credentials_file" { }

variable "myip" { }

variable "vpc_network_name" {}

variable "region" {
  default = "europe-west3"
}

variable "zone" {
  default = "europe-west3-a"
}

variable "zones" {
  type = list(string)
  default = []
  description = "Zones available in the selected region"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "machine_types" {
  type    = map
  default = {
    dev  = {
      bastion           = "e2-standard-2"
      broker            = "e2-standard-2"
      zookeeper         = "n2-standard-4"
      connect           = "e2-standard-2"
      schema-registry   = "e2-standard-2"
      control-center    = "e2-standard-2"
    }
    prod = {
      bastion           = "e2-standard-2"
      broker            = "n2-standard-16"
      zookeeper         = "n2-standard-16"
      connect           = "n2-standard-16"
      schema-registry   = "n2-standard-4"
      control-center    = "n2-standard-16"
    }
  }
}

variable "image_type" {
  default = "rhel-cloud/rhel-7"
}

variable "name" {
  type = string
}

variable "owner_name" {
  type = string
  default = ""
}

variable "owner_email" {
  type = string
  default = ""
}

variable "brokers" {
  type = number
  default = 1
}

variable "zookeepers" {
  type = number
  default = 1
}

variable "connects" {
  type = number
  default = 1
}

variable "schema-registrys" {
  type = number
  default = 1
}

variable "gce_ssh_user" {
  default = "admin"
}

variable "gce_ssh_pub_key_file" { }
