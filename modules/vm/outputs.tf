output "instance_ip" {
  value = google_compute_instance.pet_clinic_vm-unit.network_interface.0.access_config.0.nat_ip
}
