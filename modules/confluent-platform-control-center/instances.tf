resource "google_compute_instance" "control-center" {
  name         = "${var.name}-control-center"
  machine_type = var.machine_types[var.environment]["control-center"]
  tags         = [var.name, "kafka", "control-center"]
  zone         = var.zone

  labels = {
    role = "control-center"
    owner_email = var.owner_email
    owner_name = var.owner_name
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  boot_disk {
    initialize_params {
      image = var.image_type
      type  = "pd-standard"
      size  = var.disk_size["control-center"]
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
    }
  }

  can_ip_forward = true
}
