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
