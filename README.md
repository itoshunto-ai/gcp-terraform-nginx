# GCP × Kubernetes × Terraform によるスケーラブルでセキュアなクラウドインフラ構築

## 概要
このプロジェクトでは、TerraformによるIaC（Infrastructure as Code）と、Google Kubernetes Engine（GKE）を用いたコンテナオーケストレーションにより、スケーラブルかつ可観測性の高いWebインフラを構築しています。

さらに、**Horizontal Pod Autoscaler（HPA）による自動スケーリング、k6による負荷テスト、Prometheus＋Grafanaによるモニタリングを導入し、パフォーマンス最適化とセキュリティ対策を実現しました。

---

## 使用技術・構成図

- GCP
  - VPC, Subnet
  - GKE (Google Kubernetes Engine)
  - Cloud Load Balancer
- Terraform
  - IaCでGCPリソースを自動構築
  - BackendにGCSを使用（State管理）
- Kubernetes
  - Nginx Deployment（3 Pod）
  - HPAでCPU使用率に応じてスケーリング
- k6
  - HTTP負荷テスト（例：10秒間100リクエストなど）
- Prometheus & Grafana
  - モニタリング環境の構築と可視化
  - CPU使用率 / Pod数 / リクエスト状況を可視化

---

## ディレクトリ構成

```bash
.
├── terraform/                # Terraformコード（VPC, GKEなど）
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── k8s-manifests/           # Kubernetesマニフェスト（Nginx, HPAなど）
│   ├── nginx-deployment.yaml
│   ├── nginx-service.yaml
├── monitoring/              # Prometheus & GrafanaのHelmチャート導入
├── k6-tests/                # k6による負荷テストスクリプト
│   └── loadtest.js
├── README.md
