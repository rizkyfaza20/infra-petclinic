resource "google_compute_instance" "pet_clinic_vm-unit" {
    name = var.instance_name
    machine_type = var.machine_type
    zone = var.zone
    labels = {
      
    }
    tags = [ "${var.instance_name}" ]
    network_interface {
      network = var.network
      access_config {
      }
    }
    boot_disk {
      initialize_params {
        image = var.boot_disk_image
      }
    }
    metadata_startup_script = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install -y wget
    sudo apt install -y docker.io
    sudo usermod -aG docker $USER
    wget -O docker-compose.yml https://raw.githubusercontent.com/rizkyfaza20/spring-petclinic/refs/heads/main/docker-compose.yml  
    EOF
}
