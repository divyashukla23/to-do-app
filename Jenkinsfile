pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"

                    export AWS_ACCESS_KEY_ID="ASIASIANXU3ZEX5ZKBO3"
export AWS_SECRET_ACCESS_KEY="7HjDjw31Z9DXRtkN5ZRznY86ugk3e1f7FT5MZfQ9"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjECwaDGV1LWNlbnRyYWwtMSJHMEUCIQDDx49MPmTII9FJSUO7tNZTusaBN2rZXyEHZ47rTWxKdQIgElT56enj6EPNNHslpZpaNszpDtaWB8+q7c1ITsOMYXQqnAMIVRACGgwxNTQ2NDc2MzU2OTgiDHbS+3rSnCLHxWf1yir5AqMH3jFEfNOyUOZfiJma2m7YGRur0VPchwofZfWFZeBQH2JCnwzqaZrBuUrH0g+It7GOM4NxUDV+sxzCrBtdxA3PZ3bo4prOp6gn5d4yQpfVB70QO2GMwFK3AaliGhvXQ9QAs72sK3oHa6cE0klWCWQrFQbWzHR4SzC+dIFuYmwT7bcKCjBZ1AdI+OH649MMO4+pzs/9h7qlyuHDSn1nZc3HQtpuK42sNsQnQgcsYh4c+0O7jI8pBii09Q6idPgS/3OUlYIX79NxQrgrRPf2N8Z0wuMz0L4jmx5h/9106WXaxLUf4dAdjbISS15XEIpKJtQKJUXMkXiJuFKUq/aKizDTeYtNmJ5zTXnXi1ssCYM+pcHXp2P9cenC42qSbydp5Fnryz3M7xXrHoVevrglvt8cpXy3+py0CDCS+C5dhzwJiqfNe9Vb3Ij7TkQ6mcG1XiW61BqDGkp0Bl8/dFbGXHJ4ySmDemYljV5gsGqh4A00fnKZTU6Xq5AYMIXuypwGOqYB2jTS4pi9d3PvUxuCZ+6Kef9AP0cPeWCYbdaixnZhulTcqCd5aza1oD2nmb3JUfLuVnKYB8qX62DpzstrIB1gmzPcp8xVmxhHdwMT8PE77AyLVUrJqREbNxMSA3OCYcfc1GWgTFCbaaeREQjDy5q0PxJ1EH+SaR+FLpol4MekkyQGIAgquUUOw0GOX08ufmW0XE8IteQDtdboSAYj1oAEA6KlisEZsQ=="
                    terraform init -upgrade
                    echo "Formatting .tf files"
                    terraform fmt
                    terraform plan
                '''
            }
        }
        stage('Build'){
            steps{
                sh '''
                    echo "Creating Repo, Building Image, Creating EKS cluster, Creating EKS worker nodes"
                    terraform init -upgrade
                    terraform apply -auto-approve
                '''
            }
        }
        stage('Configuring the cluster with kubectl'){
            steps{
                sh '''
                        echo "Configuring..."
                        aws eks --region ap-southeast-1 update-kubeconfig --name todo-app-Cluster
                '''
            }
        }
        stage('Deploy'){
            steps{
                sh '''
                        echo "deploying the application....."
                        kubectl apply -f deployment.yml
                '''
            }
        }
    }
}