
resource "google_container_cluster" "my-cluster" {
  #name Of Cluster
  name     = "my-gke-cluster"
  #name Of Location
  location = "europe-north1"
  #VPC Name
  network = google_compute_network.my-vpc.name
  # When Cluster is Create you have at least 
  remove_default_node_pool = true
  #SubnetWork
    subnetwork = google_compute_subnetwork.restricted-subent.name
  initial_node_count       = 1
  #Logging Service 
  logging_service = "logging.googleapis.com/kubernetes"
  #Nodes Location  Zonal Cluster Each Node is Created inside different Zone
  node_locations= ["europe-north1-a","europe-north1-b","europe-north1-c"]
 
  networking_mode= "VPC_NATIVE"
 
   ip_allocation_policy {
    cluster_secondary_range_name = "k8s-pods-range"
    services_secondary_range_name = "k8s-service-range"
  }

  # Config Cluster As Private Only Access
  private_cluster_config{
    #Enabling Private nodes
    enable_private_nodes=true
    # if it True  You Can Access Nodes From any GCP VM or On-Premises So if it is True 
    # it is False accessbile only Through VPN Or Bastion Host
    enable_private_endpoint = false
    master_ipv4_cidr_block = "172.16.0.0/28"

  }


master_authorized_networks_config{
  cidr_blocks{
    cidr_block = "10.2.0.0/24"
  }
}

# To Make Sure service account inside cluster  Workload Identity allows Kubernetes service accounts to act as a user-managed Google IAM Service Account.
workload_identity_config {
   workload_pool= "omega-fabric-348508.svc.id.goog"
}

}

