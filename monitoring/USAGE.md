# 📊 Monitoring (Prometheus & Grafana)

このディレクトリは、Prometheus と Grafana を使った **パフォーマンス監視の導入方法と操作手順** を記載しています。

---

## ✅ 使用ツール
- Helm（Prometheus / Grafana のインストールに使用）
- Prometheus（メトリクス収集）
- Grafana（可視化ダッシュボード）

---

## 🔧 事前準備

以下のコマンドで Helm のリポジトリを追加し、アップデートしておきます：

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
