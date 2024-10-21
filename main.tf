terraform {
  required_providers {
        google = {
            source = "hashicorp/google"
            version = "6.7.0"
        }
    }
}

provider "google" {
  zone = "asia-southeast2-a"
  project = var.project_id
}

module "compute_instance" {
  source = "./modules/vm"
  instance_name = var.instance_name
  machine_type = var.machine_type
  zone = var.zone
  network = var.network_name
  boot_disk_image = var.boot_disk_image
}

module "vm-firewall" {
  source = "./modules/vm-firewall"
  network_name = var.network_name
  firewall_name = var.firewall_name
  instance_name = var.instance_name
}


# Optional: Database module
# module "database" {
#   source = "./modules/database"
#   database_instance_name = var.database_instance_name
#   database_name = var.database_name
#   database__version = var.database__version
#   database_tier = var.database_tier
#   database_region = var.database_region
#   database_disk_size = var.database_disk_size
#   database_user = var.database_user
#   database_password = var.database_password
# }
