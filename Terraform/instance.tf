
resource "google_compute_instance" "prv-instance" {
  name         = "prv-instance"
  machine_type = "e2-micro"
  zone         = "europe-north1-a"

   boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

#   metadata = {
#     foo = "bar"
#   }

#   metadata_startup_script = "echo hi > /test.txt"
network_interface{

    network= google_compute_network.my-vpc.self_link

    subnetwork = google_compute_subnetwork.management-subnet.self_link
}
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.kubernetes-sa.email
    scopes = ["cloud-platform"]
  }
}