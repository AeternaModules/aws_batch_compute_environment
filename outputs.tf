output "batch_compute_environments_id" {
  description = "Map of id values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "batch_compute_environments_arn" {
  description = "Map of arn values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "batch_compute_environments_compute_resources" {
  description = "Map of compute_resources values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.compute_resources if v.compute_resources != null && length(v.compute_resources) > 0 }
}
output "batch_compute_environments_ecs_cluster_arn" {
  description = "Map of ecs_cluster_arn values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.ecs_cluster_arn if v.ecs_cluster_arn != null && length(v.ecs_cluster_arn) > 0 }
}
output "batch_compute_environments_eks_configuration" {
  description = "Map of eks_configuration values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.eks_configuration if v.eks_configuration != null && length(v.eks_configuration) > 0 }
}
output "batch_compute_environments_name" {
  description = "Map of name values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.name if v.name != null && length(v.name) > 0 }
}
output "batch_compute_environments_name_prefix" {
  description = "Map of name_prefix values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.name_prefix if v.name_prefix != null && length(v.name_prefix) > 0 }
}
output "batch_compute_environments_region" {
  description = "Map of region values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.region if v.region != null && length(v.region) > 0 }
}
output "batch_compute_environments_service_role" {
  description = "Map of service_role values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.service_role if v.service_role != null && length(v.service_role) > 0 }
}
output "batch_compute_environments_state" {
  description = "Map of state values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.state if v.state != null && length(v.state) > 0 }
}
output "batch_compute_environments_status" {
  description = "Map of status values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.status if v.status != null && length(v.status) > 0 }
}
output "batch_compute_environments_status_reason" {
  description = "Map of status_reason values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.status_reason if v.status_reason != null && length(v.status_reason) > 0 }
}
output "batch_compute_environments_tags" {
  description = "Map of tags values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "batch_compute_environments_tags_all" {
  description = "Map of tags_all values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "batch_compute_environments_type" {
  description = "Map of type values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.type if v.type != null && length(v.type) > 0 }
}
output "batch_compute_environments_update_policy" {
  description = "Map of update_policy values across all batch_compute_environments, keyed the same as var.batch_compute_environments"
  value       = { for k, v in aws_batch_compute_environment.batch_compute_environments : k => v.update_policy if v.update_policy != null && length(v.update_policy) > 0 }
}

