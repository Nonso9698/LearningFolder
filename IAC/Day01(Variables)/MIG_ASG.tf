# Instance Group Manager
resource "google_compute_instance_group_manager" "appserver" {
  name               = "appserver-igm"
  base_instance_name = "app"
  zone               = "${var.primary_region}-a"

  version {
    instance_template = "projects/${var.primary_project}/global/instanceTemplates/${google_compute_instance_template.lb_instance_template_1.name}"
  }

  target_pools = [google_compute_target_pool.appserver.id]
  target_size  = 3

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 60
  }

   # Depend on instance template
  depends_on = [
    google_compute_instance_template.lb_instance_template_1
  ]
}

# Health Check
resource "google_compute_health_check" "autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 15
  timeout_sec         = 15
  healthy_threshold   = 2
  unhealthy_threshold = 10

  http_health_check {
    request_path = var.html
    port         = var.http
  }
}

resource "google_compute_autoscaler" "autoscaler" {
  name   = "my-autoscaler"
  zone   = "${var.primary_region}-a"
  target = google_compute_instance_group_manager.appserver.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 2
    cooldown_period = 15

     cpu_utilization {
      target = 0.6
    }

  }
}

# Target Pool
resource "google_compute_target_pool" "appserver" {
  name   = "appserver-target-pool"
  region = var.primary_region
}

# Backend Service
resource "google_compute_backend_service" "backend-service" {
  name             = "backend-service"
  health_checks    = [google_compute_health_check.autohealing.self_link]  # Corrected reference
  protocol         = "HTTP"
  timeout_sec      = 10
  connection_draining_timeout_sec = 60

  backend {
    group = google_compute_instance_group_manager.appserver.instance_group
  }
}

# URL Map
resource "google_compute_url_map" "url-map" {
  name            = "http-url-map"
  default_service = google_compute_backend_service.backend-service.self_link
}

# HTTP Proxy
resource "google_compute_target_http_proxy" "http-proxy" {
  name    = "http-lb-proxy"
  url_map = google_compute_url_map.url-map.self_link
}

# Forwarding Rule
resource "google_compute_global_forwarding_rule" "http-forwarding-rule" {
  name       = "http-rule"
  target     = google_compute_target_http_proxy.http-proxy.self_link
  port_range =  var.http
}
