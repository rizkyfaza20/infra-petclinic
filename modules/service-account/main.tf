resource "google_service_account" "vm_service_account" {
  account_id   = var.account_id
  display_name = "Service Account for VM Management"
}

resource "google_project_iam_member" "compute_admin_role" {
  project = var.project_id
  role    = "roles/compute.instanceAdmin.v1"
  member  = "serviceAccount:${google_service_account.vm_service_account.email}"
}

resource "google_project_iam_member" "service_account_user_role" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.vm_service_account.email}"
}




