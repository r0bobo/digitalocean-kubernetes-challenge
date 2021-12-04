terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

resource "digitalocean_kubernetes_cluster" "challenge" {
  name   = "k8s-challenge"
  region = "fra1"
  version = "1.21.5-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 1
  }
}

output "kubeconfig" {
  value     = digitalocean_kubernetes_cluster.challenge.kube_config.0.raw_config
  sensitive = true
}
