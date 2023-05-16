pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQGXIWQ2NG6"
                    export AWS_SECRET_ACCESS_KEY="ggUDAHYg9X+CcK9QhF7Tvb48OyiGwbU+O5ki89fb"
                    export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAgaDGV1LWNlbnRyYWwtMSJIMEYCIQDxZGca8xqJ8TO6+kcCa6YW22Cp0oK2CYhvRneNJmDMsgIhAN1qcC4iCCwKiuokVTglMjq+lBS5XcLtgZ6z7YykPd6WKqMDCDEQABoMMDI5OTU2NTM1MzA5IgygdH+t+ZTtFOW8QHUqgAPdHHji0ei0vnkVkYXM945dwG8rZWz9aZa1a8oIrSZ8xQcb8aBnGoY38/sEzRk+Kjd9RqRs2UdzgLEcXAHVl3eES49XQ6oU+YAFomAbO+mhT8wrS4cP4H7NzrZYp1XEawZOvmSbkFZC/pCiMDUqlREso86Bq9+KY3uDZGFqonjywpcyG8QoUB5ghJvNpMC/+qg/HD4J2TXArh0FniKVh9ZX3+2VgWs0YkFprdcvB476Jyk3tf7tmgowCKi66ogOT2wJkCpmAH2qc2LNM8S0ApIb0zBLjF4w3pcV5bN95tuHDgpfWt2pjfxi77yL3bf/mkD4X8Svk2ZZBwphaHyGWmzG4ndACrM8SGciyAoO8AoaIv2ynI0i04sr6SYqeVIVuHsRnyAbKfDwM6UBZesAzp4XGoGC1H5+s+wRtFB8RCdEyQZpGsAl33F02Xa7UbgbYnSFz8jhJMXndkeG/EYkl8mzKBVs8utGR+5LHQYyA1TQs19NQlRdic3I1BhrkLukOykwmsWOowY6pQECcqlwGZL5+lUOnzprzEvNodbs6SwzZM0zD5Lf+N7jq2u+imZNkTYIK1EBOl06fQtlfOiCQIeo2sc1U6BWVJtNymPZ+0yLUKtF35bp7AXjZq4iazkp/e9aUJdBBuyLndgq7xO8hWxAJrTbnJ8kDJyOEPBWu7MOq7Y5T0gqAtkUtauxa1KNiFJGwH6pjzr05KA4CVGNqIk28pxchvsexWi1W0iD1HI="
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