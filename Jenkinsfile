pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQGSCJX7DXY"
export AWS_SECRET_ACCESS_KEY="EFeCSES5uqhneBum5JEusRDlzuYZb9ahAf+8R0qe"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAgaDGV1LWNlbnRyYWwtMSJIMEYCIQCRDfgUIHR/uK0vceJ5JNN2c+xuL+kpVUqSIs7i6y52SAIhAJ99Q1FzZqYPEGWID7DHxVEn/Xn8FkVkcAkYMMSujw/5KqMDCDEQABoMMDI5OTU2NTM1MzA5IgyBIjt35xZpRcyLoo8qgAN/vdGqcRIflfaQC2TgBEVXFV6vpBUiNHpjCWIhptcBPiK4rpNuxEj5Wk8qp0jjIpzThL7RQrUrkBGo/LPza/q2lJrL8ZvH1Os/UclpqLryAAytiYHGKbNoKg6BM0udVPzoq5THiMhrKZWHawbTDMwpIWdjVzH80uwfYk82r6sDT6N+j76P5SpApM+NAhFjqmjcMqWBiPx9QFcJPJBaDk1YwUUq5woE810vR0kplvwxsK9Wb3G66He+3GSYjtwSVAdVy0HrYfZhLJG5tdQA1b0GbkBcC7EbbwBcdDJ7zzVUNoeyH9AjYdPvYdM+1BQd79IdIvIhIk/ajjJAa0FEVvV4vlvLjqpavXbNbmeCDwnijEMN5hfLx1uFlqHyVjOvEDS6xe1hDVOqmvwO0ivEL/0vgg4vctHrKhxfXDKu9HpDFXPEmyJ6jDeeiB625y/fH/uUgMRm4jlWOQ/QpM25obpFrlduCKq6OnUe1eFGrunxmgXbq79r52DOFLrjo+4RuVQw+9KOowY6pQHH8ldfRWIynT/hK6ARP2WkM+a8DQKl6OVyTTZYGivArKyb2wbmpui24mnnAEwSap7yUCUAmOMZNtQ/k3v+hJUECvkuCsKReIt3bf+jKTcCiXGiQlR44/G0ijbBh0j4dI3byt3Q2PSwqWoTq2wiZ9kWxkGXcwj5PKFnywYnTmFTEj3ao5263AssTA8A8KoKEm9OhFr7fOpnmysSLfsjzycRVmWdmgs="
                    terraform init
                    terraform plan
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
                        aws eks --region ap-south-1 update-kubeconfig --name todo-app-Cluster
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