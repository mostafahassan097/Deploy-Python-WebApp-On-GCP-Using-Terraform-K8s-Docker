resource "google_compute_network" "my-vpc" {
  name                    = "final-task-vpc"
  auto_create_subnetworks = false
  # routing_mode = "REGIONAL"
  delete_default_routes_on_create = false
 }