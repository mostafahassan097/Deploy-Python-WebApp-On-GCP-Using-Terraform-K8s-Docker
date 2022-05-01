resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.2.0.0/24"
  network       = google_compute_network.my-vpc.id
  region        = "europe-north1"
}