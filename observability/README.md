
This repository is ment to keep the graylog `helmfile` configuration files.


# Steps before apply the observability stack

1. Go to Kubernetes and get the `loadBalancer` value from service `graylog-tcp`. And add to fluentbit host values.
1.2. In case the data stream is private, from the same cluster, there is no need to configure the LB endpoint on fluent-bit values. It is enought to configure the graylog tcp service name as host on fluentbit values.
1. Go to graylog and create a GELF TCP (Launch new GELF TCP input).

```text
Title: GELF TCP
Bind address: 0.0.0.0
Port: 12201
```


