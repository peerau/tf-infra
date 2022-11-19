terraform {
  required_providers {
    aws = {
      source  = "hashicorp/oci"
      version = "~> 4.100.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.28.0"
    }
  }
}


 /* Oracle OCI Data + Vars */
variable "tenancy_ocid" {}
variable "compartment_ocid" {}

data "oci_core_images" "core_images" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04 Minimal aarch64"
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

data "oci_core_vnic_attachments" "oci-syd_vnic_attachments" {
    compartment_id = var.compartment_ocid
}
