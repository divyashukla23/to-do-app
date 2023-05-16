pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQGZAO67R4C"
export AWS_SECRET_ACCESS_KEY="GwPwfIJp4uVVgWcpylHhI2mrwC9mqq5oSPQP1acy"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAgaDGV1LWNlbnRyYWwtMSJIMEYCIQDfpBX5DTXiysi5Q/5jkIc/3I4+Oyfr2eshrHU96G+t4QIhAKoaZLjlMAiO6ZZVAdZOGsOp74+OCu1ry/UistTf13+JKqMDCDEQABoMMDI5OTU2NTM1MzA5IgwWY/wvPG5M1hkOJYMqgAPKi/7utHm02FeELmDv8FTNydJcSVTKm2hNONNlcphxTJuLJKSxbTdVkx56WAaUPiKTZqlJb0YJP+xmbcz0O4ZyPiyb4w2dqU1A6yy/67CxOtordR5YHYJ56gijbb5gTIaR25bnclXyL6U5Tuwvuq42hznzjZ3STDYRCwZlsYXT52ElXrPtmOBVTt4EN35dOi7nGn9DK4Jht1ZAgsM1mL7bAk/Z5ThZbLPe48/3LDAWmrVVWOj52uMmc08ln+E/Cnjq6DN/fGM6BtzG702Is+70PDTSUwsiOYW4BEqDDnpC2Xfmc8MgEUNLpF6HJFu7LeQ/vc6zc8Xxc/3v57AWr2XDC5zmYAtNU6KL75RRQq6REj2muml4DNwWDB85cx5hHSZV+IxP11lDHjZbxoroIGM8EInUVR8wmOBlcQlJNGGDnfoaQZcVsV5w/2cj7nVr25olUBUSU46l47PGhcOUNVFwt7JRnQRd8Sxg+6Y52Zb1lv2qZuZ2mRA3vS+a+2LrjNsw+sWOowY6pQFs8lzugEk9meRHGxU3gBbRErBnesLza0n53Ut262sl2It5ljK2nazQKKEk95tzOEQJRTIubcOFNuQoVip25qbLBAARuZF9TzjFQpzfsD4iZkR9pP3Di9k8qAy4MfiyRtwxQAVuEU2K7Is/PRZ2TR0R80L5CmvHYJsBCfeMNXhs1xxWLtT0N0z9hLZhlCUL3rMzT3sozHpSn18xmHILGrTWTY+NSyA="
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