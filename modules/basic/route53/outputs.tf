output "zone_id" {
  value = aws_route53_zone.this.zone_id
}

output "ns_records" {
  value = aws_route53_zone.this.name_servers
}