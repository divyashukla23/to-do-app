variable "dockerfile_dir" {
  type        = string
  description = "The directory that contains the Dockerfile"
  default     = "."
}

variable "ecr_repository_domain" {
  type        = string
  description = "Full url for the ECR repository"
  default     = "160071257600.dkr.ecr.ap-south-1.amazonaws.com"
}

variable "docker_image_tag" {
  type        = string
  description = "This is the tag which will be used for the image that you created"
  default     = "latest"
}

variable "ecr_repo_name" {
  type        = string
  description = "This is the tag which will be used for the image that you created"
  default     = "todo-app-repo"
}
variable "eks_cluster_name" {
  type        = string
  description = "This is the tag which will be used for the image that you created"
  default     = "todo-app-Cluster"
}


