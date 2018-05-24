provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source           = "./modules/app"
  public_key_path  = "${var.public_key_path}"
  google_zone      = "${var.google_zone}"
  app_disk_image   = "${var.app_disk_image}"
  instance_count   = "${var.instance_count}"

}

