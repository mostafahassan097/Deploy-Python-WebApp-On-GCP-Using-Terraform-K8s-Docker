resource "google_container_node_pool" "my-node-pool" {
  name       = "my-node-pool"
  location   = "europe-north1"
  cluster    = google_container_cluster.my-cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-micro"
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.kubernetes-sa.email
   
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
   
    disk_size_gb=10
  }
}
