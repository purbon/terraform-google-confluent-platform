resource "google_dns_managed_zone" "private-zone" {
  name        = "${var.name}-private-zone"
  dns_name    = "gcp.cp.com."
  description = "A private DNS zone for Confluent Platform"
  labels = {
    owner = var.name
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = "https://www.googleapis.com/compute/v1/projects/${var.project}/global/networks/${var.vpc_network_name}"
    }
  }
}

resource "google_dns_record_set" "broker" {
  name  = "ak${count.index}.${google_dns_managed_zone.private-zone.dns_name}"
  type  = "A"
  ttl   = 300
  count = var.brokers
  managed_zone = google_dns_managed_zone.private-zone.name

  rrdatas  = ["${element(google_compute_instance.broker.*.network_interface.0.network_ip, count.index)}"]
}

resource "google_dns_record_set" "zookeeper" {
  name  = "zk${count.index}.${google_dns_managed_zone.private-zone.dns_name}"
  type  = "A"
  ttl   = 300
  count = var.zookeepers
  managed_zone = google_dns_managed_zone.private-zone.name

  rrdatas  = ["${element(google_compute_instance.zookeeper.*.network_interface.0.network_ip, count.index)}"]
}

resource "google_dns_record_set" "schema-registrys" {
  name  = "sr${count.index}.${google_dns_managed_zone.private-zone.dns_name}"
  type  = "A"
  ttl   = 300
  count = var.schema-registrys
  managed_zone = google_dns_managed_zone.private-zone.name

  rrdatas  = ["${element(google_compute_instance.schema-registry.*.network_interface.0.network_ip, count.index)}"]
}
