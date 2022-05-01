provider "google" {
  credentials = "${file("terra-ca.json")}" #credentials
  project = "omega-fabric-348508"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}
