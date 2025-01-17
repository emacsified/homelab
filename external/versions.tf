terraform {
  required_version = "~> 1.1.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ash-homelab"

    workspaces {
      name = "ash-homelab"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.4.0"
    }

    b2 = {
      source  = "Backblaze/b2"
      version = "~> 0.7.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.7.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 2.1.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "b2" {
  application_key_id = var.b2_application_key_id
  application_key    = var.b2_application_key
}

provider "kubernetes" {
  host = "http://192.168.1.110:6443"

  # Use KUBE_CONFIG_PATH environment variables
  # Or in cluster service account
}
