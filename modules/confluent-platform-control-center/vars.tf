
variable "project" { }

variable "credentials_file" { }

variable "myip" { }

variable "vpc_network_name" { }

variable "dns_zone" {}

variable "name" {
  type = string
  #default = ""
}

variable "owner_name" {
  type = string
  default = ""
}

variable "owner_email" {
  type = string
  default = ""
}

variable "region" {
  default = "europe-west3"
}

variable "zone" {
  default = "europe-west3-a"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "machine_types" {
  type    = map
  default = {
    dev  = {
      control-center    = "e2-standard-2"
    }
    prod = {
      control-center    = "n2-standard-16"
    }
  }
}

variable "image_type" {
  default = "rhel-cloud/rhel-7"
}

variable "gce_ssh_user" {
  default = "admin"
}

variable "gce_ssh_pub_key_file" {
#  default = "/Users/pere/.ssh/id_rsa_gcloud.pub"
}
