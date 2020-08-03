
provider "google" {

  version = "3.30.0"
  credentials = file(var.credentials_file)

  project = var.project
  region = var.region
  zone = var.zone

}


output "ip" {
  value = ["${google_compute_instance.broker.*.network_interface.0.access_config.0.nat_ip}"]
}

output "brokers" {
  value = google_compute_instance.broker.*.id
}

output "dns_zone" {
  value = google_dns_managed_zone.private-zone
}
