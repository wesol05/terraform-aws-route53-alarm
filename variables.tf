variable "domain" {
  description = "The fully qualified domain name of the endpoint to be checked."
}
variable "path" {
  default = "/"
  description = "The path that you want Amazon Route 53 to request when performing health checks."
}
variable "sns-topic" {
  description = "Name of the topic where to send a notifications."
}
variable "failure_threshold" {
  default = 3
  description = "The number of consecutive health checks that an endpoint must pass or fail."
}
variable "request_interval" {
  default = 30
  description = "The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request."
}
variable "https" {
  default = true
  description = "Use https or http."
}
variable "enabled" {
  type = bool
  default = true
}
variable "tags" {
  type = "map"
  default = {}
  description = "Tags attached to created resources."
}
variable "period" {
  default = 60
  description = "The period in seconds over which the specified statistic is applied."
}
variable "evaluation_periods" {
  default = 1
  description = "The number of periods over which data is compared to the specified threshold."
}