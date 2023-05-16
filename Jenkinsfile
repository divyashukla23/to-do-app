pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQGYVCZEQ6W"
                    export AWS_SECRET_ACCESS_KEY="khoZEQ86zscldkzlCgJ9wWdFuiYELcbcTlTLS7eV"
                    export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAgaDGV1LWNlbnRyYWwtMSJHMEUCIFKGlnLwnZrxq3o9wYmRStToPENhkDqEvJNSGHdDO3fWAiEA/ZsjcZihYWfXzbR7zQkOF5xIQ0cizoQSFRp7TTaaroYqowMIMRAAGgwwMjk5NTY1MzUzMDkiDKcCgVdMUXCTDeWbwiqAA0qA5JID4q7x40X00l18hx2je2m7VjKend/sIPBfCIhYdN36tBmW2dw6iZIab4cVYx0tcVl3UeK66td6aGM6ad9jj7dJERzzDA0DP+m+4SkT4Qc5xBUmvcdUKK1XubiUymB96uZW4K5vHR4w5dMzvrmm18z1HNnh0+Xs/yN+Mc4uH8QEdnamjXUb5Tux4zZyXeK7UDCc93HPpqgOtwiYCh3dpTG4fepICBbJAAbwHv4F9p9skjE8vHbf8I956gWpZQ1pCGL3s2orUynjPm4zu9ENNDK4dn5Gur+dkZc/b40FvsA82TTofj4rZpZN2NlP/a2VHUQo0iVrFgwRt+IFvymwK9OTZ1kb8HlGML3jjFVICF7zaBx/lOMvslFTLzovMoBioaPt/dXcNexEq7LqQtrvTHRrDMrTHC6lzbRKBxUYfrgF5e8WBnHicB9RC+loQVvpbTyTXLqV41Rxsvo/ZEaJrWli1MMNthsRiKPJl0zADRxynhUCsTL4zRcNCGudXDD02Y6jBjqmAemzmD8j/vMk5PgVN5Y+wyg9+bGKOAJqewb2qXTfdmTkLqWB1lu5o9nle+0bOoz/xRhIJvRVPoHURlh0LFVPL3DdXcWyLIdBZWXOD5luswVwVobO97y4yIgrxJxcZwhJXhnL0oaY8yU+CDxOy5F8z4knQl6tm1SMosrHOZUJlESIB58guSbZrLcggNcVkpfe3ShRhMCfdt/Klk+w3MeTTQ2dh1x7074="
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