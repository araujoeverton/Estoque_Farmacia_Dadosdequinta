# ./modules/mwaa/alb.tf - Configuração do Application Load Balancer para Alta Disponibilidade

# Application Load Balancer
resource "aws_lb" "airflow_webserver" {
  count              = var.create_alb ? 1 : 0
  name               = "${var.environment}-airflow-alb"
  internal           = var.alb_internal
  load_balancer_type = "application"
  security_groups    = var.alb_security_groups
  subnets            = var.alb_internal ? var.private_subnet_ids : var.public_subnet_ids
  
  enable_deletion_protection = true
  enable_http2              = true
  
  access_logs {
    bucket  = var.s3_bucket_arn
    prefix  = "alb-logs"
    enabled = true
  }
  
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-airflow-alb"
    }
  )
}

# Target Group para o Webserver
resource "aws_lb_target_group" "airflow_webserver" {
  name     = "${var.environment}-airflow-target"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
  health_check {
    enabled             = true
    interval            = 30
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200"
  }
  
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 86400
    enabled         = true
  }
  
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-airflow-target"
    }
  )
}

# HTTPS Listener 
resource "aws_lb_listener" "airflow_https" {
  count             = var.create_alb && var.create_https_listener ? 1 : 0
  load_balancer_arn = aws_lb.airflow_webserver[0].arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.acm_certificate_arn
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.airflow_webserver.arn
  }
}

# HTTP Listener (redireciona para HTTPS se configurado)
resource "aws_lb_listener" "airflow_http" {
  count             = var.create_alb ? 1 : 0
  load_balancer_arn = aws_lb.airflow_webserver[0].arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type = var.create_https_listener ? "redirect" : "forward"
    
    dynamic "redirect" {
      for_each = var.create_https_listener ? [1] : []
      content {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
    
    dynamic "forward" {
      for_each = var.create_https_listener ? [] : [1]
      content {
        target_group {
          arn = aws_lb_target_group.airflow_webserver.arn
        }
      }
    }
  }
}

# AWS WAF WebACL para proteção do ALB (opcional)
resource "aws_wafv2_web_acl" "airflow_waf" {
  count         = var.create_alb && var.enable_waf ? 1 : 0
  name          = "${var.environment}-airflow-waf"
  description   = "WAF para proteger o ALB do Airflow"
  scope         = "REGIONAL"
  
  default_action {
    allow {}
  }
  
  # Regras para proteção básica contra ataques comuns
  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 10
    
    override_action {
      none {}
    }
    
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
    
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "${var.environment}-airflow-waf-common"
      sampled_requests_enabled   = true
    }
  }
  
  # Regra para bloquear SQL Injection
  rule {
    name     = "AWSManagedRulesSQLiRuleSet"
    priority = 20
    
    override_action {
      none {}
    }
    
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }
    
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "${var.environment}-airflow-waf-sqli"
      sampled_requests_enabled   = true
    }
  }
  
  # Limitação de taxa para evitar ataques de força bruta
  rule {
    name     = "RateLimitRule"
    priority = 30
    
    action {
      block {}
    }
    
    statement {
      rate_based_statement {
        limit              = 1000
        aggregate_key_type = "IP"
      }
    }
    
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "${var.environment}-airflow-waf-ratelimit"
      sampled_requests_enabled   = true
    }
  }
  
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.environment}-airflow-waf-metrics"
    sampled_requests_enabled   = true
  }
  
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-airflow-waf"
    }
  )
}

# Associação do WAF com ALB
resource "aws_wafv2_web_acl_association" "airflow_alb" {
  count        = var.create_alb && var.enable_waf ? 1 : 0
  resource_arn = aws_lb.airflow_webserver[0].arn
  web_acl_arn  = aws_wafv2_web_acl.airflow_waf[0].arn
}

# Route 53 Record para acessar o Airflow (opcional)
resource "aws_route53_record" "airflow" {
  count   = var.create_alb && var.create_dns_record ? 1 : 0
  zone_id = var.route53_zone_id
  name    = var.airflow_domain
  type    = "A"
  
  alias {
    name                   = aws_lb.airflow_webserver[0].dns_name
    zone_id                = aws_lb.airflow_webserver[0].zone_id
    evaluate_target_health = true
  }
}