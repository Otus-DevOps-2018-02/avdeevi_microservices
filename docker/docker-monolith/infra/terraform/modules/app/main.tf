resource "google_compute_instance" "app" {
  count        = "${var.instance_count}"
  name         = "docker-app-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.google_zone}"

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }

  tags = ["docker-app"]

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

}

