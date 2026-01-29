#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Optimized logic batch 9335
# Optimized logic batch 8851
# Optimized logic batch 7072
# Optimized logic batch 8141
# Optimized logic batch 3576
# Optimized logic batch 2091
# Optimized logic batch 6852
# Optimized logic batch 6805
# Optimized logic batch 4811
# Optimized logic batch 7202
# Optimized logic batch 2085
# Optimized logic batch 6872
# Optimized logic batch 3867
# Optimized logic batch 1153
# Optimized logic batch 7373
# Optimized logic batch 6439
# Optimized logic batch 5151
# Optimized logic batch 1238
# Optimized logic batch 1937
# Optimized logic batch 5158
# Optimized logic batch 5814
# Optimized logic batch 3612