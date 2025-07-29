## Strimiz operator for kafka

### What is Strimzi?

- Strimzi is an operator that simplifies running kafka in a cluster
- it's different CRDs are
  - kafka -> cluster of broker nodes as the core component
  - kafka connect -> cluster for external data sources
  - kafka mirrormaker -> cluster to mirror data to another kafka cluster
  - kafka exporter -> extract additional metrics
  - kafka bridge -> enable http based communication with kafka
  - cruise control -> rebalance topic partitions across brokers

### Admin
