resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 2
    memory = 2

  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key  = file(var.privat_key_path)
    host     = self.network_interface.0.nat_ip_address
  }

  provisioner "file" {
    source = "../modules/app/provisioners/install_app.sh"
    destination = "/tmp/install_app.sh"
  }

  provisioner "file" {
    source = "../modules/app/provisioners/setup_app.sh"
    destination = "/tmp/setup_app.sh"
  }

  provisioner "file" {
    source = "../modules/app/provisioners/enable_app.sh"
    destination = "/tmp/enable_app.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/install_app.sh",
      "sudo chmod +x /tmp/setup_app.sh",
      "sudo chmod +x /tmp/enable_app.sh",

      "export DATABASE_URL='${var.database_url}:27017'",
      "echo $DATABASE_URL",

      "sudo -E bash -c '/tmp/install_app.sh'",
      "bash -c '/tmp/setup_app.sh'",
      "sudo -E bash -c '/tmp/enable_app.sh'"
    ]
  }
}
