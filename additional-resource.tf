# Load Balancer
resource "google_compute_instance_group" "hello_world_group" {
    name        = "hello-world-group"
    description = "Hello World instance group"

    instances = [
    google_compute_instance.hello_world_app.self_link,
    # Add more instances as needed
    ]
}

resource "google_compute_health_check" "hello_world_health_check" {
    name = "hello-world-health-check"
    http_health_check {
    port = "8080"
    }
}

resource "google_compute_backend_service" "hello_world_backend" {
    name        = "hello-world-backend"
    health_checks = [google_compute_health_check.hello_world_health_check.self_link]
    backend {
        group = google_compute_instance_group.hello_world_group.self_link
    }
}

# Cloud CDN
resource "google_compute_url_map" "hello_world_url_map" {
    name            = "hello-world-url-map"
    default_service = google_compute_backend_service.hello_world_backend.self_link
}

resource "google_compute_target_http_proxy" "hello_world_proxy" {
    name    = "hello-world-proxy"
    url_map = google_compute_url_map.hello_world_url_map.self_link
}

resource "google_compute_global_address" "hello_world_address" {
    name = "hello-world-address"
}

resource "google_compute_global_forwarding_rule" "hello_world_forwarding_rule" {
    name       = "hello-world-forwarding-rule"
    target     = google_compute_target_http_proxy.hello_world_proxy.self_link
    ip_address = google_compute_global_address.hello_world_address.address
    port_range = "80"
}
