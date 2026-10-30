### Переменные для виртуальных машин

variable "vm_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Platform ID for all VMs"
}

variable "vm_cores" {
  type        = number
  default     = 2
  description = "Default number of CPU cores"
}

variable "vm_memory" {
  type        = number
  default     = 2
  description = "Default amount of RAM in GB"
}

variable "vm_core_fraction" {
  type        = number
  default     = 5
  description = "Guaranteed vCPU share in percent"
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "Use preemptible VMs"
}

variable "vm_nat" {
  type        = bool
  default     = true
  description = "Enable public IP (NAT) for VMs"
}

### Переменные для дисков

variable "vm_boot_disk_size" {
  type        = number
  default     = 5
  description = "Boot disk size in GB"
}

variable "vm_boot_disk_type" {
  type        = string
  default     = "network-hdd"
  description = "Boot disk type for web and db VMs"
}

variable "vm_storage_disk_size" {
  type        = number
  default     = 5
  description = "Boot disk size in GB for storage VM"
}

variable "vm_storage_disk_type" {
  type        = string
  default     = "network-ssd"
  description = "Boot disk type for storage VM"
}

variable "vm_additional_disk_size" {
  type        = number
  default     = 1
  description = "Size of additional disks for storage VM"
}

### Список ВМ для for_each

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      disk_volume = 5
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 4
      disk_volume = 5
    }
  ]
  description = "List of VMs for for_each loop"
}
