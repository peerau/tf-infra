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

/* Cloudflare Data + Vars */
provider "cloudflare" {
  # token pulled from $CLOUDFLARE_API_TOKEN
}

variable "ncon_zid" {
  default = "0800ef0a8e2df96ebbbc51c249140e94"
}
variable "nrou_zid" {
  default = "8f0f57a1b626f7fff2ab46b4d67ef877"
}
variable "nsec_zid" {
  default = "710eb9eb353688ce5cf608cc9cb2e729"
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
