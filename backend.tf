terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "medmouine-personal"

    workspaces {
      name = "personal"
    }
  }
}
