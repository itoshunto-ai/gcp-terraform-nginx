provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

resource "google_compute_network" "vpc_network" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "custom-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
}

resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnet.name
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "gke-node-pool"
  location   = google_container_cluster.primary.location
  cluster    = google_container_cluster.primary.id
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # ✅ ディスクサイズを30GBに変更
    disk_size_gb = 30

    # ✅ ディスクタイプを pd-standard に変更
    disk_type    = "pd-standard"

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
