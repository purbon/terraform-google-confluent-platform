output "platform_dns_zone" {
    value = module.confluent-cluster.dns_zone
}

output "platform_brokers" {
    value = module.confluent-cluster.brokers
}
