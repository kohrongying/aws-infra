resource "aws_route53_zone" "this" {
  name = var.domain_name
}

resource "aws_route53_record" "these" {
  count   = length(var.records)
  zone_id = aws_route53_zone.this.zone_id
  name    = var.records[count.index].name
  type    = var.records[count.index].type
  ttl     = var.records[count.index].ttl
  records = var.records[count.index].records
}