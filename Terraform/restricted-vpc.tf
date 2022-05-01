resource "google_compute_subnetwork" "restricted-subent" {
  name          = "restricted-subent"
  ip_cidr_range = "10.3.0.0/24"
  network       = google_compute_network.my-vpc.id
  region        = "europe-north1"
  private_ip_google_access = true
  secondary_ip_range{
      range_name = "k8s-pods-range"
      ip_cidr_range = "10.20.0.0/20"
  }

  secondary_ip_range{
      range_name = "k8s-service-range"
      ip_cidr_range = "10.52.0.0/20"
  }
}