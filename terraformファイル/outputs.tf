output "gke_cluster_name" {
  description = "作成したGKEクラスタの名前"
  value       = google_container_cluster.primary.name
}

output "gke_endpoint" {
  description = "GKEクラスタのエンドポイント"
  value       = google_container_cluster.primary.endpoint
}

output "gke_region" {
  description = "GKEのリージョン"
  value       = google_container_cluster.primary.location
}
