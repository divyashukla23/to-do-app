provider "aws" {
  region = "ap-south-1" # Setting my region to mumbai. Use your own region here
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "subnet_1" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_ecr_repository" "my_todo_app_ecr_repo" {
  name = var.ecr_repo_name # Naming my repository

}

# Builds test-service and pushes it into aws_ecr_repository
resource "null_resource" "ecr_image" {

  # Runs the build.sh script which builds the dockerfile and pushes to ecr
  provisioner "local-exec" {
    command = "bash ${path.module}/bin/build.sh ${var.dockerfile_dir} ${var.ecr_repository_domain} ${var.docker_image_tag} ${var.ecr_repo_name}"
  }
}
