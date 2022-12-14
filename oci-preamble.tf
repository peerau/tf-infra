variable "ssh_public_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKoaoGwuX2cx0FYeOybU5Q/VcHoOouRq0lbXDdNzqiOw"
}

variable "instance_shape" {
  default = "VM.Standard.A1.Flex"
}

variable "user_data" {
  #!! WARNING !!#
  # nixos infect payload #
  default = "IyEvYmluL3NoCmNwIH51YnVudHUvLnNzaC9hdXRob3JpemVkX2tleXMgfnJvb3QvLnNzaC9hdXRob3JpemVkX2tleXMKY2htb2QgMDYwMCB+cm9vdC8uc3NoL2F1dGhvcml6ZWRfa2V5cwpjdXJsIGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9lbGl0YWsvbml4b3MtaW5mZWN0L21hc3Rlci9uaXhvcy1pbmZlY3QgfCBOSVhfQ0hBTk5FTD1uaXhvcy0yMi4wNSBiYXNoIDI+JjEgfCB0ZWUgL3RtcC9pbmZlY3QubG9n"
}

variable "instance_ocpus" { default = 1 }

variable "instance_shape_config_memory_in_gbs" { default = 6 }

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

/* Network */

resource "oci_core_virtual_network" "core_vcn" {
  cidr_block      = "10.101.1.0/24"
  compartment_id  = var.compartment_ocid
  display_name    = "CoreVCN"
  dns_label       = "corevcn"
  is_ipv6enabled  = true
}

resource "oci_core_subnet" "core_subnet" {
  cidr_block        = "10.101.1.0/25"
  ipv6cidr_block    = cidrsubnet(oci_core_virtual_network.core_vcn.ipv6cidr_blocks[0], 8, 0)
  display_name      = "corepubSubnet"
  dns_label         = "corepubsubnet"
  security_list_ids = [oci_core_security_list.core_security_list.id]
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.core_vcn.id
  route_table_id    = oci_core_route_table.core_route_table.id
  dhcp_options_id   = oci_core_virtual_network.core_vcn.default_dhcp_options_id
}

resource "oci_core_internet_gateway" "core_internet_gateway" {
  compartment_id = var.compartment_ocid
  display_name   = "coreIG"
  vcn_id         = oci_core_virtual_network.core_vcn.id
}

resource "oci_core_route_table" "core_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.core_vcn.id
  display_name   = "coreRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.core_internet_gateway.id
  }
}

resource "oci_core_security_list" "core_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.core_vcn.id
  display_name   = "coreSecurityList"

  egress_security_rules {
    protocol = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "all"
    source   = "0.0.0.0/0"
  }
}
