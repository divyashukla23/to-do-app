pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIASKRH5RYAP46YKAUB"
                    export AWS_SECRET_ACCESS_KEY="DmDroeEDryh6yvw8xxXMv4HIA/8RoNGmZPrrPaob"
                    export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAcaDGV1LWNlbnRyYWwtMSJHMEUCIQDaMWYkSvm+oW81Jah9gQHwaOhYRfu3c+TswNONQSuvwgIgLhWomnhApXzUz1dqk1QJzs9XGfuIXwxmdUmuEwUyNsYqowMIMBAEGgwxNjAwNzEyNTc2MDAiDEW8jI7Z5XeB2fWtLyqAA7IZK+IpyBEDUxfXz56/t8pCIvmRcW51tZ/c8Pbbc+mefgYTD7SzOCy6dro2z8aufgVQszwRriB6i0M9Y2ip539nKVtStBoI9OgZ/eb9PMrutlRQdSTzHR9xEb/hPHQK7g5Vx1/NDDlGQ1nXlOyffhymZYorrRME8WY4Vln+f6Rn509pyBcqwPwYUqkYcSn1Xgr8JMCABbcHLZo3gfgNO2x7ZpT+ZRTrFUPqqNiUUV5TodqyW0N9t+7/AqpyabZUU8Y7C7rw21XA/Zi6vcM0P2zYrXs3iPj/302P8S7Fp2W27dNjqtje73giPwrBYjjzD+Dspu2CkxLaZxpONeOjpL4ZaTzl3klqn05Wm2G7R+ipFbFs1Z0TZRkXCd4/ANHxVxm45SnYlSTOPLFnU9ERSzstXtr1N1YmXIeTVJiUJNU7TNmhNx2Xgs0+ahs6ubw71feyYQEzz/VaaPC7VODBBJ4APrD2D/LqzRqxFkSvj60vyLqhum6koBw6lRU1Z2oK2DD8uo6jBjqmAYMby7i8zXeVQBXZGoplnq9HROdtvXhX0BgAqwXiGnsfLTJSchCMG2444RCOpK1Vb1sienXQL8ydTZvnIZAByU8YNVvHbEbh6tggbc8Fvcqe+Gybtp5+5MPQkOu+hNQfwhcTbSPKt8UzctDdo+9kIf3IqCW5Q/N92C0i7asVBvtPhjObT1Cx5Jwop9gyArvCMd0RPIr9L6JnEJ8KAI0cg5a/CtuQ+P4="                   
                    terraform -version
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