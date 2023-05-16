pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh "
                export AWS_ACCESS_KEY_ID="ASIAQN6MMOQG7OFSGX6P" && export AWS_SECRET_ACCESS_KEY="KYDTRBsRBmflYHNSNuPDcvFrDR/V1vTIW79zMDJa" && export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAsaDGV1LWNlbnRyYWwtMSJGMEQCIBvPTxJqCHwbb5JMr6YL7nkh+3sEXmPgx+CYOD04IxTYAiBIKMieo3eUFRWTKoWqwp1RXPvai3fa4pAJWd/iAHxQVSqjAwg0EAAaDDAyOTk1NjUzNTMwOSIMWv8Bg+m3gQQdHpa+KoADpv0aEqBKzF3Ua/Zh5H1x8B57bMIFc/e4gbCWOekxlPzYW5QD33gjX7VFsDS8+fXUZcvUzNNZIpF2pD3XsFmTb52U/dIQK+OgomoX6QN9//ctbYgKce8s6qyDDWGW5y8WoxeaQ44AW2VBRg0JdY6u7MmPCblZ5wVScJW7I0LmZBYEPQHLTqVN6H5HaXTjngp+BKZBG98pRzvlm3QYt5DPXk4EsM5fveVxmbUMyYKGBpd1P6fpujl43GydtyVBa4xyF+UQP9dl3kUZH1y1wNXXw1ghWtObnpoclYDIniZt2HqCjRJ10uvvmyR/IOUdfllQDbSA2SPaYP59qBESCzyRnxmJfgRR9dGADEY+6qD2hOaWfpgwdhBbeGMuQ6NOiuo7ooVgRjBohehPNfdAxV+h6TvwoVqWDlrHTztl4cmq3y95ipiW8kffhVIL8lgtK4wyk5ucATkr08QWCcG2gXeO9H0jXOPth/zoQrhu2W2voISdmkdu9vz0BEBsJxjAXwwAMMufj6MGOqcBE6UQJfaT5FJpG30d69+g6ob7c4bttX1lmj0uDmPc6k7DwOQIpIjcvWbW1N6TTQSi8yEB6nl0ufYGPk1Gw+tguEVpyrkzVaRpGVzH/IQRpcKlAfnESqP3cM9gXBxwxzjBjkkVxJTRMCKjnsLG/DVRHD/+/tAttaZW/z4KDlwMv2jHpRYll0db3Gs3Uf/ugxJpTK5zkr3kcyFyFFWScJWLT7BBeXSYryg=" && terraform init
                "
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