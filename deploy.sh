#!/bin/bash

set -e

echo "🚀 Starting Local Deployment to Kind Cluster..."

echo "📦 Building Docker image (python-scraper:latest)..."
docker build -t python-scraper:latest .

echo "🔄 Loading image into Kind cluster..."
kind load docker-image python-scraper:latest --name dev-cluster

echo "⚙️ Applying Kubernetes configurations..."
kubectl apply -f k8s/deployment.yaml

echo "♻️ Restarting the Pods to use the new image..."
kubectl rollout restart deployment python-scraper-app

echo "✅ Deployment Successful! Your app is running smoothly on Kind."