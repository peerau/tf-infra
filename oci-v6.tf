resource "oci_core_ipv6" "oci-syd-nix0_ipv6" {
    vnic_id = [for x in data.oci_core_vnic_attachments.oci-syd_vnic_attachments.vnic_attachments: x.vnic_id if x.instance_id == oci_core_instance.oci-syd-nix0.id][0]
}

resource "oci_core_ipv6" "oci-syd-nix1_ipv6" {
    vnic_id = [for x in data.oci_core_vnic_attachments.oci-syd_vnic_attachments.vnic_attachments: x.vnic_id if x.instance_id == oci_core_instance.oci-syd-nix1.id][0]
}

resource "oci_core_ipv6" "oci-syd-nix2_ipv6" {
    vnic_id = [for x in data.oci_core_vnic_attachments.oci-syd_vnic_attachments.vnic_attachments: x.vnic_id if x.instance_id == oci_core_instance.oci-syd-nix2.id][0]
}

resource "oci_core_ipv6" "oci-syd-nix3_ipv6" {
    vnic_id = [for x in data.oci_core_vnic_attachments.oci-syd_vnic_attachments.vnic_attachments: x.vnic_id if x.instance_id == oci_core_instance.oci-syd-nix3.id][0]
}
