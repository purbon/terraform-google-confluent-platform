// Forwarding rule for Internal Load Balancing
resource "google_compute_forwarding_rule" "default" {
  name   = "${var.name}-kafka-forwarding-rule"
  region = var.region

  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.brokers_service.id
  all_ports             = true
  network               = var.vpc_network_name

}


resource "google_compute_region_backend_service" "brokers_service" {
  region = var.region
  name = "${var.name}-brokers-region-service"
  health_checks = [google_compute_health_check.broker-tcp-hc.id]
  protocol = "TCP"
  load_balancing_scheme = "INTERNAL"
}


resource "google_compute_health_check" "broker-tcp-hc" {
  name = "${var.name}-broker-tcp-health-check"

  timeout_sec        = 1
  check_interval_sec = 1

  tcp_health_check {
    port = "9092"
  }
}
