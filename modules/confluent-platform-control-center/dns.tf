resource "google_dns_record_set" "control-center" {
  name  = "c3.${var.dns_zone.dns_name}"
  type  = "A"
  ttl   = 300
  managed_zone = var.dns_zone.name

  rrdatas  = ["${google_compute_instance.control-center.network_interface.0.network_ip}"]
}
