provider "aws" {
  region = "ap-southeast-1" # Setting my region to Singapore. Use your own region here
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

# # Adding IAM policy to ECR resources
# resource "aws_ecr_repository_policy" "demo-repo-policy" {
# repository = aws_ecr_repository.my_todo_app_ecr_repo.name
#   policy     = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "ecr:BatchCheckLayerAvailability",
#                 "ecr:BatchGetImage",
#                 "ecr:GetDownloadUrlForLayer",
#                 "ecr:GetAuthorizationToken"
#             ],
#             "Resource": "*"
#         }
#     ]
# }
# EOF
# }

# resource "aws_iam_role" "repo" {
#   name = "${var.ecr_repo_name}-ECR-Role"

#   assume_role_policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# POLICY
# }


# resource "aws_iam_role_policy_attachment" "ecr_policy" {
#   policy_arn = "arn:aws:iam::154647635698:policy/todo-app-12345"
#   role       = aws_iam_role.repo.name
# }






# Builds test-service and pushes it into aws_ecr_repository
resource "null_resource" "ecr_image" {

  # Runs the build.sh script which builds the dockerfile and pushes to ecr
  provisioner "local-exec" {
    command = "bash ${path.module}/bin/build.sh ${var.dockerfile_dir} ${var.ecr_repository_domain} ${var.docker_image_tag} ${var.ecr_repo_name}"

  }
}
