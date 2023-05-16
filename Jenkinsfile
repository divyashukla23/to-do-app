pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQG3JBEKXUX"
export AWS_SECRET_ACCESS_KEY="y6rMT+WSUe8efQ0j8qZT2kzxnS9BPFa/xujCoXCA"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAkaDGV1LWNlbnRyYWwtMSJGMEQCICfbwh2XDsvt8fFVuuLVosWwkhKsLvBpSDsgOwxwVEocAiBArpFshiFuPgAjmmBwHye4Z6u1oS2rCINR13MXMK7jxCqjAwgyEAAaDDAyOTk1NjUzNTMwOSIMicnpERguSMagLmeeKoADkKPQRbmU9Ul11cM3InypgcZu1Hm+KlTnJRt6VVlG0PwTIrQU7A8414psLzX95g60BhbzOLBPqz4eifZ7+d1n2QDLj7q4UTCV8zUkT9Z7OHgGuIx+rL+OmC0/YnY9cdzKK5ztLFpdHhw7xWbI5Uwe9blJWseEk9XPjqJe0+zECff1w1L5/0bNAMiAO7CgkTUPSpcfO9EIY74cRJx+bfDt1dGScklDlUo88o02pf6oMPUA/jhhjZGMZzWS7aybIdPLzSHgRqtJ0/OR2IdTaDIDknU1Yh7gTXk0DKlCeZ2EVjU76La9S0Yd8uXs2jEAa56S2PRsr0IcN2ZQMV5EO5KeXUhksbwTvnB4YQUfUaN+QoiPIFQdcLLuQYS3a0A/N53FUWip7KDs5GwMYDpz9hwu/BHp1bjgHi2cd0fvzDAAMuyNtsH6XN45hcKNi/kD7StY4n8BUEgl7eIAdKT/LUdydH8oX5bcpdrMl+zOU6K1a9Oxre14QrmBBM8NszK+Rql4MNjgjqMGOqcBS0Fi6jWNDX4+WTA2E/gnTJ+L5oP9aJOZLlzHN+hJercawIKZr7K8MHdwbblVl7lHZY5pZpaBqrH09fvR7fP3xlGp1F/mFjrdxqNlZIH452lln0ebZqaLBiAr6uaqMeU20auLE8Zsrdzvmvmw0dvwmbGTeDymxiOiBekekhkqv8pkjsR9OoKOBcCyvsBqYMnjl2ed3dJ/F35z13abXtHSJ2wsGp7EUHg="
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