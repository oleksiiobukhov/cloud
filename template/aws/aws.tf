provider "aws" {
  region = "${var.location}"
}
  
resource "aws_instance" "test_VM" {
  # Amazon Linux AMI 2017.03.1 (HVM) 
  ami           = "ami-449f483b"
  instance_type = "t2.micro"

  tags {
    Name = "${var.vm_name}"
  }
}

variable "vm_name" {
   description = "Name for VM"
}

variable "location" {
      default = "ap-northeast-1"
      description = "Resource location"
}
   
  error123  