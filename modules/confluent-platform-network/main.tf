
provider "google" {
  version = "3.30.0"
  credentials = file(var.credentials_file)

  project = var.project
  region = var.region
  zone = var.zone
}


output "vpc_net_name" {
  value = google_compute_network.vpc_network.name
}
