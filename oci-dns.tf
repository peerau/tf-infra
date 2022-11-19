resource "cloudflare_record" "oci-syd-nix0_AAAA" {
  zone_id = var.ncon_zid
  name    = oci_core_instance.oci-syd-nix0.display_name
  value   = oci_core_ipv6.oci-syd-nix0_ipv6.ip_address
  type    = "AAAA"
  proxied = false
  allow_overwrite = true
}
resource "cloudflare_record" "oci-syd-nix0_A" {
  zone_id = var.ncon_zid
  name    = oci_core_instance.oci-syd-nix0.display_name
  value   = oci_core_instance.oci-syd-nix0.public_ip
  type    = "A"
  proxied = false
  allow_overwrite = true
}

resource "cloudflare_record" "oci-syd-nix1_AAAA" {
  zone_id = var.ncon_zid
  name    = oci_core_instance.oci-syd-nix1.display_name
  value   = oci_core_ipv6.oci-syd-nix1_ipv6.ip_address
  type    = "AAAA"
  proxied = false
  allow_overwrite = true
}
resource "cloudflare_record" "oci-syd-nix1_A" {
  zone_id = var.ncon_zid
  name    = oci_core_instance.oci-syd-nix1.display_name
  value   = oci_core_instance.oci-syd-nix1.public_ip
  type    = "A"
  proxied = false
  allow_overwrite = true
}

resource "cloudflare_record" "oci-syd-nix2_AAAA" {
  zone_id = var.ncon_zid
  name    = oci_core_instance.oci-syd-nix2.display_name
  value   = oci_core_ipv6.oci-syd-nix2_ipv6.ip_address
  type    = "AAAA"
  proxied = false
  allow_overwrite = true
}
resource "cloudflare_record" "oci-syd-nix2_A" {
  zone_id = var.ncon_zid
  name    = oci_core_instance.oci-syd-nix2.display_name
  value   = oci_core_instance.oci-syd-nix2.public_ip
  type    = "A"
  proxied = false
  allow_overwrite = true
}

resource "cloudflare_record" "oci-syd-nix3_AAAA" {
  zone_id = var.ncon_zid
  name    = oci_core_instance.oci-syd-nix3.display_name
  value   = oci_core_ipv6.oci-syd-nix3_ipv6.ip_address
  type    = "AAAA"
  proxied = false
  allow_overwrite = true
}
resource "cloudflare_record" "oci-syd-nix3_A" {
  zone_id = var.ncon_zid
  name    = oci_core_instance.oci-syd-nix3.display_name
  value   = oci_core_instance.oci-syd-nix3.public_ip
  type    = "A"
  proxied = false
  allow_overwrite = true
}
