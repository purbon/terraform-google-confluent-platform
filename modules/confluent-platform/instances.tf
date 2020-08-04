
resource "google_compute_instance" "bastion" {
  name         = "${var.name}-bastion"
  machine_type = var.machine_types[var.environment]["bastion"]
  tags         = [var.name, "kafka", "bastion"]
  zone         = var.zones[0]

  labels = {
    role = "bastion"
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
      size  = var.disk_size["bastion"]
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
    }
  }

  can_ip_forward = true
}

resource "google_compute_instance" "broker" {
  name         = "${var.name}-broker-${count.index}"
  count        = var.brokers
  machine_type = var.machine_types[var.environment]["broker"]
  tags         = [var.name, "kafka", "broker"]
  zone         = element(var.zones, count.index)

  labels = {
    role = "broker"
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
      size  = var.disk_size["broker"]
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  can_ip_forward = true
}

resource "google_compute_instance" "zookeeper" {
  name         = "${var.name}-zookeeper-${count.index}"
  count        = var.zookeepers
  machine_type = var.machine_types[var.environment]["zookeeper"]
  tags         = [var.name, "kafka", "zookeeper"]
  zone         = element(var.zones, count.index)

  labels = {
    role = "zookeeper"
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
      size  = var.disk_size["zookeeper"]
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  can_ip_forward = true
}


resource "google_compute_instance" "connect" {
  name         = "${var.name}-connect-${count.index}"
  count        = var.connects
  machine_type = var.machine_types[var.environment]["connect"]
  tags         = [var.name, "kafka", "connect"]
  zone         = element(var.zones, count.index)

  labels = {
    role = "connect"
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
      size  = var.disk_size["connect"]
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
    }
  }

  can_ip_forward = true
}

resource "google_compute_instance" "schema-registry" {
  name         = "${var.name}-schema-registry-${count.index}"
  count        = var.schema-registrys
  machine_type = var.machine_types[var.environment]["schema-registry"]
  tags         = [var.name, "kafka", "schema-registry"]
  zone         = element(var.zones, count.index)

  labels = {
    role = "connect"
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
      size  = var.disk_size["schema-registry"]
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
    }
  }

  can_ip_forward = true
}
