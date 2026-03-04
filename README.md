# 🚀 Local Kubernetes Python Scraper Deployment

This project demonstrates a complete local DevOps workflow for deploying a containerized Python Web Scraper (FastAPI + Google Chrome) into a local Kubernetes cluster using `kind` (Kubernetes IN Docker). 

It includes a custom local CI/CD automation script to seamlessly build, load, and deploy updates with zero downtime.

## ✨ Features
* **Containerized Python App:** Uses `python:3.11-slim` with optimized layer caching and built-in Google Chrome setup for scraping.
* **Local Kubernetes Cluster:** Utilizes `kind` to run a lightweight, multi-node-capable K8s environment locally.
* **Memory Optimization:** Configured `/dev/shm` volume mounts to prevent Chrome from crashing inside the container.
* **Automated Deployment:** A single bash script (`deploy.sh`) to build the Docker image, load it into the cluster, and apply Kubernetes manifests automatically.
* **Zero Downtime Updates:** Uses `kubectl rollout restart` to ensure the application remains available during updates.

## 🛠️ Prerequisites
Before running this project, ensure you have the following installed on your local machine:
* [Docker](https://docs.docker.com/get-docker/)
* [kind (Kubernetes IN Docker)](https://kind.sigs.k8s.io/docs/user/quick-start/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/)

## 📂 Project Structure
```text
.
├── Dockerfile              # Instructions to build the Python app image
├── docker-compose.yml      # (Optional) For running via Docker Compose
├── requirements.txt        # Python dependencies
├── main.py                 # Main FastAPI application script
├── k8s/
│   └── deployment.yaml     # Kubernetes Deployment & NodePort Service manifests
└── deploy.sh               # Automation script for local deployment
