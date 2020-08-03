# Terraform module for Confluent Platform (GCP)

Terraform Module(s) for deploying the Confluent Platform within Google Cloud.



# Features

## Feature Metric

| CP Component    | EC2 Instance | EBS Volumes |  DNS        | Firewall        | Load Balancers | Multi zone |
|:--------------- |:------------:|:-----------:|:-----------:|:---------------:|:--------------:|:----------:|
| Zookeeper       | X            | X           | X           | X               | N/A            | X          |
| Kafka Broker    | X            | X           | X           | X               | WiP            | X          |
| Kafka Connect   | X            | X           | X           | X               | N/A            | X          |
| Schema Registry | X            | X           | X           | X               | N/A            | X          |
| Control Center  | X            | X           | X           | X               | N/A            | X          |

## Feature Limitations

1. There are some Platform components actually missing

Components such as REST-Proxy and KsqlDB are currently missing in this module. They will be added soon.

2. No specific nodes for monitoring are setup

This module setup only nodes for Confluent Platform
