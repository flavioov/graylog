# eks autoscaler tagging
# https://docs.aws.amazon.com/pt_br/eks/latest/userguide/cluster-autoscaler.html
resource "spotinst_ocean_aws_launch_spec" "launch_spec" {
  name                        = "graylog"
  ocean_id                    = var.ocean_id
  image_id                    = var.ami
  user_data                   = <<-EOF
      #!/bin/bash
      set -ex
      /etc/eks/bootstrap.sh ${var.eks_name}
      EOF
  iam_instance_profile        = var.iam_instance_profile
  security_groups             = var.security_groups
  subnet_ids                  = var.subnet_ids
  restrict_scale_down         = false
  root_volume_size            = 30
  associate_public_ip_address = false

  instance_types = [
    "t3a.medium"
  ]

  strategy {
    spot_percentage = 0
  }

  create_options {
    initial_nodes = var.desired_capacity
  }

  delete_options {
    force_delete = true
  }

  autoscale_headrooms {
    num_of_units    = 0
    cpu_per_unit    = 1000
    gpu_per_unit    = 0
    memory_per_unit = 2048
  }

  resource_limits {
    max_instance_count = var.max_size
    min_instance_count = var.min_size
  }


  taints {
    key    = "app"
    value  = "graylog"
    effect = "NoExecute"
  }

  labels {
    key   = "App"
    value = "graylog"
  }

  labels {
    key   = "CostCenter"
    value = "430"
  }

  labels {
    key   = "Owner"
    value = "msp"
  }


  labels {
    key   = "Shared"
    value = "true"
  }

  tags {
    key   = "Name"
    value = "graylog-Worker-Node-eks-prd-002"
  }

  tags {
    key   = "kubernetes.io/cluster/${var.eks_name}"
    value = "owned"
  }
  tags {
    key   = "Shared"
    value = "true"
  }

  tags {
    key   = "Environment"
    value = "production"
  }

  tags {
    key   = "CostCenter"
    value = "430"
  }

  tags {
    key   = "Owner"
    value = "mozaiko"
  }


}
