resource "google_compute_firewall" "pet_clinic_vm_firewall" {
  name = var.firewall_name
  network = google_compute_network.pet_clinic_network.name
  allow {
    protocol = "tcp"
    ports = [ "22", "80", "8080" ]
  }
  source_tags = [ "${var.instance_name}" ]
}

resource "google_compute_network" "pet_clinic_network" {
  name = var.network
}