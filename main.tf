resource "aws_route53_health_check" "health_check" {
  type          = var.https ? "HTTPS" : "HTTP"
  fqdn          = var.domain
  resource_path = var.path
  port          = var.https ? 443 : 80

  cloudwatch_alarm_region = "us-east-1"
  failure_threshold = var.failure_threshold
  request_interval = var.request_interval

  tags = merge(var.tags, {Name: var.domain})
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name = var.domain
  comparison_operator = "LessThanThreshold"
  evaluation_periods = var.evaluation_periods
  statistic = "Minimum"
  threshold = 1
  period = var.period
  treat_missing_data = "missing"

  dimensions = {
    HealthCheckId = aws_route53_health_check.health_check[count.index].id
  }
  metric_name = "HealthCheckStatus"
  namespace = "AWS/Route53"

  tags = var.tags
}

