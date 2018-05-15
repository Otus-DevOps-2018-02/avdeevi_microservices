variable public_key_path {
  description = "Path to the public key used for ssh access"
}

#variable private_key_path {
#  description = "Path to the private key used for ssh access"
#}

variable google_zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable instance_count {
  description = "Count"
  default     = "1"
}

variable app_disk_image {
  description = "Disk image for ubuntu"
  default     = "ubuntu-1604-lts"
}

