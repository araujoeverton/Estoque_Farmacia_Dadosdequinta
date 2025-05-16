# ./modules/mwaa/main.tf - Implementação do Managed Workflows for Apache Airflow

resource "aws_mwaa_environment" "airflow" {
  name                = "${var.environment}-airflow"
  airflow_version     = var.airflow_version
  environment_class   = var.environment_class
  
  # Alta disponibilidade - Multi-AZ
  min_workers         = var.min_workers
  max_workers         = var.max_workers
  
  # Configuração do Executor Kubernetes
  execution_role_arn  = aws_iam_role.airflow_execution_role.arn
  
  # Rede
  dag_s3_path         = var.dag_s3_path
  plugins_s3_path     = var.plugins_s3_path
  requirements_s3_path = var.requirements_s3_path
  
  # Armazenamento S3 para DAGs, logs e plugins
  source_bucket_arn   = var.s3_bucket_arn
  
  # Modo de acesso ao Webservers
  webserver_access_mode = var.webserver_access_mode
  
  # Rede VPC
  network_configuration {
    security_group_ids = [aws_security_group.airflow.id]
    subnet_ids         = var.private_subnet_ids
  }
  
  # Logs
  logging_configuration {
    dag_processing_logs {
      enabled   = true
      log_level = "INFO"
    }
    
    scheduler_logs {
      enabled   = true
      log_level = "INFO"
    }
    
    task_logs {
      enabled   = true
      log_level = "INFO"
    }
    
    webserver_logs {
      enabled   = true
      log_level = "INFO"
    }
    
    worker_logs {
      enabled   = true
      log_level = "INFO"
    }
  }
  
  # Configurações personalizadas do Airflow
  airflow_configuration_options = merge(
    {
      "core.default_timezone" : "America/Sao_Paulo",
      "scheduler.min_file_process_interval" : "30",
      "celery.worker_autoscale" : "16,4",
      "scheduler.dag_dir_list_interval" : "30",
      "webserver.workers" : "4",
      "webserver.worker_refresh_batch_size" : "4",
      "webserver.web_server_master_timeout" : "120",
      "webserver.web_server_worker_timeout" : "120",
      "webserver.dag_default_view" : "tree",
      "webserver.dag_orientation" : "TB",
      # Configuração para o Kubernetes Executor
      "kubernetes.worker_container_repository" : "${var.docker_repository}",
      "kubernetes.worker_container_tag" : "${var.docker_tag}",
      "kubernetes.delete_worker_pods" : "True",
      "kubernetes.namespace" : "airflow",
      "kubernetes.pod_template_file" : "/usr/local/airflow/k8s/pod_template.yaml"
    },
    var.airflow_configuration_options
  )
  
  # Segurança
  kms_key = var.kms_key_arn
  
  # Metadados
  tags = var.tags
}

# Configuração do Launch Template para Web Server em Alta Disponibilidade
resource "aws_launch_template" "airflow_webserver" {
  name_prefix   = "${var.environment}-airflow-webserver-"
  image_id      = var.ami_id  # AMI personalizada com Airflow ou AMI oficial da AWS para MWAA
  instance_type = var.webserver_instance_type
  
  iam_instance_profile {
    name = aws_iam_instance_profile.airflow_webserver.name
  }
  
  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.airflow_webserver.id]
  }
  
  user_data = base64encode(templatefile("${path.module}/templates/user_data.sh.tpl", {
    environment_name = aws_mwaa_environment.airflow.name,
    region           = data.aws_region.current.name
  }))
  
  block_device_mappings {
    device_name = "/dev/xvda"
    
    ebs {
      volume_size           = 30
      volume_type           = "gp3"
      delete_on_termination = true
      encrypted             = true
    }
  }
  
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }
  
  monitoring {
    enabled = true
  }
  
  tag_specifications {
    resource_type = "instance"
    
    tags = merge(
      var.tags,
      {
        Name = "${var.environment}-airflow-webserver"
      }
    )
  }
  
  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group para alta disponibilidade do Web Server
resource "aws_autoscaling_group" "airflow_webserver" {
  name                = "${var.environment}-airflow-webserver"
  min_size            = var.webserver_instance_count
  max_size            = var.webserver_instance_count * 2
  desired_capacity    = var.webserver_instance_count
  vpc_zone_identifier = var.private_subnet_ids
  
  launch_template {
    id      = aws_launch_template.airflow_webserver.id
    version = "$Latest"
  }
  
  health_check_type         = "ELB"
  health_check_grace_period = 300
  
  target_group_arns = [aws_lb_target_group.airflow_webserver.arn]
  
  termination_policies = ["OldestInstance"]
  
  dynamic "tag" {
    for_each = merge(
      var.tags,
      {
        Name = "${var.environment}-airflow-webserver"
      }
    )
    
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  
  lifecycle {
    create_before_destroy = true
  }
  
  depends_on = [aws_mwaa_environment.airflow]
}

# Auto Scaling Policy para CPU
resource "aws_autoscaling_policy" "webserver_cpu" {
  name                   = "${var.environment}-airflow-webserver-cpu"
  autoscaling_group_name = aws_autoscaling_group.airflow_webserver.name
  policy_type            = "TargetTrackingScaling"
  
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    
    target_value = 70.0
  }
}

# Definição de região atual
data "aws_region" "current" {}