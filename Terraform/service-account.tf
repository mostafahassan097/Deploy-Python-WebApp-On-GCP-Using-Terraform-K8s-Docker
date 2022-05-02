

resource "google_service_account" "kubernetes-sa" {
  account_id   = "kubernetes-sa"
}

# Grant Kubernetes Engine Admin Role To All Instances in The Cluster (Bastion Host + Nodes)
resource "google_project_iam_member" "kub-admin" {
  project = "omega-fabric-348508"
  role    = "roles/container.admin" 
  member  = "serviceAccount:${google_service_account.kubernetes-sa.email}"
}

resource "google_project_iam_member" "storage-rol" {
  project = "omega-fabric-348508"
  role = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.kubernetes-sa.email}"
}
