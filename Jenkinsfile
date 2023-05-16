pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    cd tf
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIASKRH5RYANPOOHOZP"
                    export AWS_SECRET_ACCESS_KEY="snAL/Co20dFtX/PYK6tFcpARb7qPc0Bq1hZqzSu7"
                    export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAYaDGV1LWNlbnRyYWwtMSJHMEUCIQCAjkVcofazpQbhhI+GassWU3ufVfklvlFMTPcz/n78/AIgMZPIjI1Tca8tzzxzxE6UTZ4EpeJGksceXU/PYJDtgecqowMILxAEGgwxNjAwNzEyNTc2MDAiDKXm7qfXKe28fLTFtiqAA98YhbnWsZwAEWi9nC0YrM8dUaWUpdYZSxwwcjT4IsbMT7q4z7Y4U0tMg98INyTpoNy22vJ68aRRj8RrL9D3JIDvx5T+6Tgw3/sDU9Sd3VuLvhWSJAzJ81C46ivBbLLux2aQtj0IZYsv5Ntdn8Jrao1bSm7ryV1lfyhvdBOrc2VO0YICvEmXJMbWhzDi6yHicaniulBtJUXyOwgHSKX4w4QeywsWCPgfeA0LCiJhylgPHV4mZFJyeg6FHzuAvsTGB/advAu/5MLodlzl3MT5x93hMIbHMn/hsAzzyuy45rvZbGC2MA+InTHGOppt9KCmjGczSGeqFmaUdu/QinWgoUAnIpPketY7lZDNr01pn0T5aU9bSmhx4DS0vjcSjYTkvGDM1NbqKMwSGHBV6CRkCMSneO8aJCAZG1CpyfM7atLY5crEagVhNair0ZojTHhcmMSu1Hecw+7gjpckqmg+msPwr0oXYcS8q4KDT8Vj1bRQzk6/pyK6dSsW/c3VQGQ9RjCGoI6jBjqmAUWsjv2O6PZDlEQYZ/Q+XkTSGGw7OA50Lp3CfJAT27Dfx+MjIuLjQZLZO5JdzEcx6LO/K2MQBlqAqHI+dAswply438EoFdoWV9tgxnpzhtLgwVrdS2xHxNwuJbCn+tA/jff8lVD5siTirhKAIgvGbVpeC3MHRtHtD0tEvVN4g3pkHkWkZlpJbRbbEltjGQaKN8DYbvR3ORoNJUNJKYzicbxDRKHrCIM="                    terraform init
                    terraform init 
                    echo "Formatting .tf files"
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