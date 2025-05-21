variable "project_id" {
  description = "GCP プロジェクト ID"
  type        = string
  default     = "dreamer-terraform-gke-dev"
}

variable "region" {
  description = "GCPのリージョン"
  type        = string
  default     = "asia-northeast1"
}

variable "credentials_file" {
  description = "GCPの認証情報（サービスアカウントキー）のパス"
  type        = string
  default     = "terraform-key.json"
}
