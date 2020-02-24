resource "google_dns_managed_zone" "dns-zone-med-codes" {
  name        = "dns-zone-med-codes"
  dns_name    = "med.codes."
  description = "Main DNS Zone for med.codes"
}
