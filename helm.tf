# elastic search
resource "helm_release" "bitnami_elasticsearch" {
  name             = "elasticsearch"
  namespace        = "graylog"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "elasticsearch"
  version          = "14.5.3"
  create_namespace = true
  recreate_pods    = true
  values           = ["${file("values/elasticsearch.yml")}"]
}

# https://kubernetes.io/docs/concepts/cluster-administration/logging/
resource "helm_release" "fluent_fluentbit" {
  name             = "fluent-bit"
  namespace        = "graylog"
  repository       = "https://fluent.github.io/helm-charts"
  chart            = "fluent-bit"
  version          = "0.15.15"
  create_namespace = true
  recreate_pods    = true
  values           = ["${file("values/fluent-bit.yml")}"]

  depends_on = [spotinst_ocean_aws_launch_spec.launch_spec]
}

resource "helm_release" "bitnami_mongodb" {
  name             = "mongodb"
  namespace        = "graylog"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "mongodb"
  version          = "10.20.2"
  create_namespace = true
  recreate_pods    = true
  values           = ["${file("values/mongodb.yml")}"]
}

resource "helm_release" "kongz_graylog" {
  name             = "graylog"
  namespace        = "graylog"
  repository       = "https://charts.kong-z.com"
  chart            = "graylog"
  version          = "1.7.10"
  create_namespace = true
  recreate_pods    = true
  values           = ["${file("values/graylog.yml")}"]

  depends_on = [spotinst_ocean_aws_launch_spec.launch_spec]
}