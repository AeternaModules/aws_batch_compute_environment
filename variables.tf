variable "batch_compute_environments" {
  description = <<EOT
Map of batch_compute_environments, attributes below
Required:
    - type
Optional:
    - name
    - name_prefix
    - region
    - service_role
    - state
    - tags
    - tags_all
    - compute_resources (block):
        - allocation_strategy (optional)
        - bid_percentage (optional)
        - desired_vcpus (optional)
        - ec2_configuration (optional, block):
            - image_id_override (optional)
            - image_kubernetes_version (optional)
            - image_type (optional)
        - ec2_key_pair (optional)
        - image_id (optional)
        - instance_role (optional)
        - instance_type (optional)
        - launch_template (optional, block):
            - launch_template_id (optional)
            - launch_template_name (optional)
            - version (optional)
        - max_vcpus (required)
        - min_vcpus (optional)
        - placement_group (optional)
        - security_group_ids (optional)
        - spot_iam_fleet_role (optional)
        - subnets (required)
        - tags (optional)
        - type (required)
    - eks_configuration (block):
        - eks_cluster_arn (required)
        - kubernetes_namespace (required)
    - update_policy (block):
        - job_execution_timeout_minutes (optional)
        - terminate_jobs_on_update (optional)
EOT

  type = map(object({
    type         = string
    name         = optional(string)
    name_prefix  = optional(string)
    region       = optional(string)
    service_role = optional(string)
    state        = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    compute_resources = optional(object({
      allocation_strategy = optional(string)
      bid_percentage      = optional(number)
      desired_vcpus       = optional(number)
      ec2_configuration = optional(list(object({
        image_id_override        = optional(string)
        image_kubernetes_version = optional(string)
        image_type               = optional(string)
      })))
      ec2_key_pair  = optional(string)
      image_id      = optional(string)
      instance_role = optional(string)
      instance_type = optional(set(string))
      launch_template = optional(object({
        launch_template_id   = optional(string)
        launch_template_name = optional(string)
        version              = optional(string)
      }))
      max_vcpus           = number
      min_vcpus           = optional(number)
      placement_group     = optional(string)
      security_group_ids  = optional(set(string))
      spot_iam_fleet_role = optional(string)
      subnets             = set(string)
      tags                = optional(map(string))
      type                = string
    }))
    eks_configuration = optional(object({
      eks_cluster_arn      = string
      kubernetes_namespace = string
    }))
    update_policy = optional(object({
      job_execution_timeout_minutes = optional(number)
      terminate_jobs_on_update      = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.batch_compute_environments : (
        v.compute_resources == null || (v.compute_resources.ec2_configuration == null || (length(v.compute_resources.ec2_configuration) <= 2))
      )
    ])
    error_message = "Each ec2_configuration list must contain at most 2 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_compute_environments : (
        v.compute_resources == null || (v.compute_resources.ec2_configuration == null || alltrue([for item in v.compute_resources.ec2_configuration : (item.image_id_override == null || (length(item.image_id_override) >= 1 && length(item.image_id_override) <= 256))]))
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_compute_environments : (
        v.compute_resources == null || (v.compute_resources.ec2_configuration == null || alltrue([for item in v.compute_resources.ec2_configuration : (item.image_kubernetes_version == null || (length(item.image_kubernetes_version) >= 1 && length(item.image_kubernetes_version) <= 256))]))
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_compute_environments : (
        v.compute_resources == null || (v.compute_resources.ec2_configuration == null || alltrue([for item in v.compute_resources.ec2_configuration : (item.image_type == null || (length(item.image_type) >= 1 && length(item.image_type) <= 256))]))
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_compute_environments : (
        v.update_policy == null || (v.update_policy.job_execution_timeout_minutes == null || (v.update_policy.job_execution_timeout_minutes >= 1 && v.update_policy.job_execution_timeout_minutes <= 360))
      )
    ])
    error_message = "must be between 1 and 360"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

