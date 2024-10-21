variable "instance_name" {
  default = "pet-clinic-vm-unit-001"
}
variable "project_id" {}

variable "machine_type" {
    default = "e2-micro"
}
variable "zone" {
    default = "us-west1-a"
}
variable "network_name" {
  default = "pet-clinic-network"
}
variable "boot_disk_image" {
  default = "ubuntu/ubuntu-2204-jammy-v20240927"
}
variable "database_instance_name" {
    default = "pet-clinic-db-unit-001"
}
variable "database_name" {
    default = "pet-clinic-db-unit-001"
}
variable "database__version" {
    default = "POSTGRES_14"
}
variable "database_tier" {
    default = "db-f1-micro"
}
variable "database_region" {
    default = "us-west1-a"
}
variable "database_disk_size" {
    default = "10"
}
variable "database_user" {
    default = "user_pet_clinic"
}
variable "database_password" {
    default = "Chang3mE!@#"
}
variable "firewall_name" {
    default = "pet-clinic-firewall"
}