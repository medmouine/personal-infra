provider "google" {
  project     = "medmouine-cluster"
  region      = "us-east1"
  zone        = "us-east1-c"
}

module "dns" {
  source = "./dns"
}

module "k8s-cluster" {
  source = "./k8s-cluster"
  cluster_master_password = var.cluster_master_password
  cluster_master_username = var.cluster_master_username
}

output "name_servers" {
  value = module.dns.ns
}
