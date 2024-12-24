data "google_container_cluster" "k8s-cluster" {
  name     = var.cluster_name       
  location = var.location   
}

data "google_client_config" "default" {}



provider "kubernetes" {
  host                   = data.google_container_cluster.k8s-cluster.endpoint
  cluster_ca_certificate = base64decode(data.google_container_cluster.k8s-cluster.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

# Create Kubernetes Namespaces
resource "kubernetes_namespace" "namespace" {
  count = length(var.namespace_names)

  metadata {
    name = var.namespace_names[count.index]
  }
}

