variable "ssh_public_key" {
  default = ""
}

variable "instance_shape" {
  default = "VM.Standard.A1.Flex"
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
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "3000"
      min = "3000"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "3005"
      min = "3005"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "80"
      min = "80"
    }
  }
}

/* Instances */

resource "oci_core_instance" "oci-syd-nix0" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "oci-syd-nix0"
  shape               = var.instance_shape

  shape_config {
    ocpus = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.core_subnet.id
    display_name     = "primaryvnic"
    assign_public_ip = false
    hostname_label   = "oci-syd-nix0"
  }

  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.core_images.images[0], "id")
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}