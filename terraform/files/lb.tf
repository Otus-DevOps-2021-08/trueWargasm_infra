
resource "yandex_lb_target_group" "tgt_group" {
  name      = "target-group"
  region_id = "ru-central1"

  dynamic "target" {
    for_each = [
      for tgt in yandex_compute_instance.app :
      {
        subnet_id = tgt.network_interface.0.subnet_id
        address   = tgt.network_interface.0.ip_address
      }
    ]

    content {
      subnet_id = target.value.subnet_id
      address   = target.value.address
    }

  }

}

resource "yandex_lb_network_load_balancer" "lb" {
  name = "network-load-balancer"

  listener {
    name        = "listener"
    port        = 80
    target_port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.tgt_group.id

    healthcheck {
      name = "tcp"
      tcp_options {
        port = 9292
      }
    }
  }
}
