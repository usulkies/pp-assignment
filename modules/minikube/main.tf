resource "minikube_cluster" "minikube" {
  driver       = var.minikube_driver
  cluster_name = var.cluster_name
  addons       = var.addons
  nodes        = var.cluster_nodes
}