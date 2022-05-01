provider "google" {
  credentials = "${file("omega-fabric-348508-59b864582fe6.json")}"
  project = "omega-fabric-348508"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}
