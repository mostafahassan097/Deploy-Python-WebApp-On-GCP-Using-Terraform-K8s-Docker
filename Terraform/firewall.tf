resource "google_compute_firewall" "default" {
  name    = "allow-ssh"
  network = google_compute_network.my-vpc.name


  allow {
    protocol = "tcp"
    ports    = ["22","80","443"]
  }

  source_ranges = ["0.0.0.0/0"]
} 