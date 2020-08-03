resource "google_compute_network" "vpc_network" {
  name = "${var.name}-kafka-network"
  description = "A network for Confluent Platform"
  auto_create_subnetworks = true
}
