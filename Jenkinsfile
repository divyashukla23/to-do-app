pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQGTS6HK54U"
export AWS_SECRET_ACCESS_KEY="Z/lHBPARjx6QiG0j4u9d5NGVyX6YnlZk4xFU3MMX"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAkaDGV1LWNlbnRyYWwtMSJHMEUCIDfce/3KsrKAQTJvASqIXt+342jhhvRw86HQ/gjyxHE6AiEA9N9bvYTUxhL+rdRqb50IxerfcozCVjtP4izM3zkTXIoqowMIMhAAGgwwMjk5NTY1MzUzMDkiDMV7gkIfKpoPV57QpiqAA6hpSpi9dl7W3WnHXqF7zb7tfED556q0Fmj6bNLgce7Yr/qYczhb0zdoEaIF439+uhHDyjXlGtUIyifak2tl+EisIeYMwWhPFwhRLfx/mbUMFyRkw8wtOb8O0YjUDO1mmnWaFm+Io9glQSdwsis4rF7aqE9+H2MRPzNhbIEa4/g/k4r/1oToS2PpzAP5iTPYOMCMl0fV3PREfKazjCeeGFPQIHjs6URgEN+14lCvti3QBSqhOqaJ/3XCPbmJCtSY/R5h8uT9V4+A9v9bJC5NYu22SsKLY7ZJVmqpVr8SbhPHLaU/6gRLMDBbi2FdzpqIpHoCnv88xAmiezHfBBfBxFAcl+I4qbnYjiWfxD06D+ijKopJ/cP/uUssynAobuSlo1QPgARVZhR533KYQsDW/Vqf4MF00R31fSrXWJjN+fAmp9f0KRFWU3LLZZkM6h8WtuvPArAUIro8eyS1ZBLoj+buUKv/GWGceRGlqeyE+i2MNH0XtmdN3v9758j7KVb6eDDc5Y6jBjqmAe+INdWq6rrcgE6BM5QL2ANkyMBj2y8ultpWyzAgI+aGm6wGZ153PoGPo8lf2QXcPIn9Hjc3mCoI5hcRWkfyVtkuWcxJSRgS8BpRbB/nKUtNnbkbt8Dz+6O/Nysr8GoW37Bj1itx7DC46L9/9QUkLQa743+h1m/ySfk+DWOPt93SdvqJMGuOJLIhXbvYJjTTLZGf86MfS0uS2XdjoU56w6yHMhDgZII="
                    terraform init
                '''
            }
        }
        stage('Build'){
            steps{
                sh '''
                    echo "Creating Repo, Building Image, Creating EKS cluster, Creating EKS worker nodes"
                    terraform apply -auto-approve
                '''
            }
        }
        stage('Configuring the cluster with kubectl'){
            steps{
                sh '''
                        echo "Configuring..."
                        aws eks --region ap-south-1 update-kubeconfig --name todo-app
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