resource "google_container_cluster" "personal-cluster" {
  name = "personal-cluster"
  location = "us-east1-c"
  remove_default_node_pool = true
  initial_node_count = 1

  master_auth {
    username = var.cluster_master_username
    password = var.cluster_master_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "personal_preemptible_nodes" {
  name = "personal-node-pool"
  location = "us-east1-c"

  cluster = google_container_cluster.personal-cluster.name
  node_count = 1

  node_config {
    preemptible = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoint = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}