// Configure the Google Cloud provider
provider "google" {
  region      = "${var.location}"
}

// Create a new instance
resource "google_compute_instance" "default" {
 //project      = "${google_project_services.project.project}"
 zone         = "${var.location_zone}"
 name         = "${var.vm_name}"
 machine_type = "f1-micro"
 boot_disk {
   initialize_params {
     image = "ubuntu-1604-xenial-v20170328"
   }
 }
 network_interface {
   network = "default"
   access_config {
    // leave empty to create a new Ephemeral IP
   }
 }
}

variable "vm_name" {
  description = "Name for VM to be created"
}

variable "location" {
  default = "us-central2222"
  description = "Resource location"
}

variable "location_zone" {
  default = "us-central1-a"
  description = "Availability Zone"
}

output "instance_id" {
 value = "${google_compute_instance.default.self_link}"
}
