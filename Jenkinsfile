pipeline{
    agent any
    // environment{
    //     DOCKER_IMAGE_NAME = "prasanna593/jenkins-demo"
    //     DOCKER_USERNAME = "prasanna593"
    //     DOCKER_PASSWORD = credentials('DOCKER_SECRET')
    // }
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    terraform init -upgrade
                    echo "Formatting .tf files"
                    terraform fmt
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