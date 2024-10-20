resource "google_sql_database_instance" "pet-clinic-db" {
  name = var.database_instance_name
  database_version = var.database__version
  region = var.database_region

    settings {
        tier = var.database_tier
        disk_size = var.database_disk_size
        deletion_protection_enabled = true
    }
}

resource "google_sql_user" "pet-clinic-db-user" {
  instance = google_sql_database_instance.pet-clinic-db.name
  name = var.database_user
  password = var.database_password
}

resource "google_sql_database" "pet-clinic-db" {
  name = var.database_name
  instance = google_sql_database_instance.pet-clinic-db.name
}
