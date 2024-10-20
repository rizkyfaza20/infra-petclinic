resource "google_compute_instance" "pet_clinic_vm-unit" {
    name = var.instance_name
    machine_type = var.machine_type
    zone = var.zone
    network_interface {
      network = var.network
    }
    boot_disk {
      initialize_params {
        image = var.boot_disk_image
      }
    }
    tags = [ "${var.instance_name}" ]
    metadata_startup_script = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install -y curl wget
    sudo apt install -y docker.io
    sudo usermod -aG docker $USER
    wget -O docker-compose.yml  
    EOF
}