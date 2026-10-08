resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    webservers = [
      {
        name = yandex_compute_instance.web[0].name
        ip   = yandex_compute_instance.web[0].network_interface[0].nat_ip_address
        fqdn = yandex_compute_instance.web[0].fqdn
      },
      {
        name = yandex_compute_instance.web[1].name
        ip   = yandex_compute_instance.web[1].network_interface[0].nat_ip_address
        fqdn = yandex_compute_instance.web[1].fqdn
      }
    ]
    databases = [
      {
        name = yandex_compute_instance.db["main"].name
        ip   = yandex_compute_instance.db["main"].network_interface[0].nat_ip_address
        fqdn = yandex_compute_instance.db["main"].fqdn
      },
      {
        name = yandex_compute_instance.db["replica"].name
        ip   = yandex_compute_instance.db["replica"].network_interface[0].nat_ip_address
        fqdn = yandex_compute_instance.db["replica"].fqdn
      }
    ]
    storage = [
      {
        name = yandex_compute_instance.storage.name
        ip   = yandex_compute_instance.storage.network_interface[0].nat_ip_address
        fqdn = yandex_compute_instance.storage.fqdn
      }
    ]
  })

  filename = "${path.module}/inventory.ini"
}
