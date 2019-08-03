// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}


// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
  name         = "mstakx-level1-k8s-master-${random_id.instance_id.hex}"
  machine_type = "n1-highcpu-4"
  zone         = "europe-west3-a"

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  provisioner "file" {
    source      = "./scripts/setup-wrapper.sh"
    destination = "setup-wrapper.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/setup-wrapper.sh",
      "cd ~",
      "./setup-wrapper.sh"
    ]
  }
  
  connection {
    type = "ssh"
    user = "ubuntu"
    host = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

}

output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}

