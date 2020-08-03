variable "control-center-port" {
  type = number
  default = 9021
}

resource "google_compute_firewall" "control-center" {
  name    = "confluent-platform-control-center-firewall"
  network = var.vpc_network_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["${var.control-center-port}"]
  }

  source_ranges = [ "${var.myip}/32" ]
  source_tags = ["broker", "control-center"]
  target_tags = ["broker", "control-center"]
}
