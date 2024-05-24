terraform {
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "5.30.0"
        }
    }
}

provider "google" {
    project = "id-me-presentation"
    region  = "us-east1"
}

resource "google_sql_database_instance" "hello_world_db" {
    name             = "hello-world-db"
    database_version = "POSTGRES_14"
    settings {
    tier = "db-f1-micro"
    }
}

resource "google_compute_instance" "hello_world_app" {
    name         = "hello-world-app"
    machine_type = "f1-micro"

    boot_disk {
        initialize_params {
        image = "debian-cloud/debian-11"
    }
}

    network_interface {
        network = "default"
        access_config {
        }
    }
}
