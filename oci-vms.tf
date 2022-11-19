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
    assign_public_ip = true
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

resource "oci_core_instance" "oci-syd-nix1" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "oci-syd-nix1"
  shape               = var.instance_shape

  shape_config {
    ocpus = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.core_subnet.id
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "oci-syd-nix1"
  }

  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.core_images.images[0], "id")
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}

resource "oci_core_instance" "oci-syd-nix2" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "oci-syd-nix2"
  shape               = var.instance_shape

  shape_config {
    ocpus = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.core_subnet.id
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "oci-syd-nix2"
  }

  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.core_images.images[0], "id")
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}

resource "oci_core_instance" "oci-syd-nix3" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "oci-syd-nix3"
  shape               = var.instance_shape

  shape_config {
    ocpus = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.core_subnet.id
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "oci-syd-nix3"
  }

  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.core_images.images[0], "id")
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}
