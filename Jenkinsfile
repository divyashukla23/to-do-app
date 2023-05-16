pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQGULEBRQKK"
export AWS_SECRET_ACCESS_KEY="Ne/5PdFnExpHphCW+p0kY+ODmVoPLReuAtIq8QJU"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAoaDGV1LWNlbnRyYWwtMSJIMEYCIQD4KdrHF1wmtrR5ws3AA7O0ZGDBTHqEPjHyBCxG8YPuJwIhALBrIpAilqXBMm8Yvd3SI/goAdfOcNR12/KpnKFvUiK3KqMDCDMQABoMMDI5OTU2NTM1MzA5Igw4Y+YeflKiRqOZFUUqgAMKKeqVxX++8ecx82dp8AO1+3xxELbV2jBGBt+TbTDvUwAc95tKDKlKN+mDdEIuh6HVRTpDHZxK1Rqqj4RedSzKNvoHdXlaGV7btIt6Jc+fxDd2q0YfxQNtqbmHbFpRlRVO8dabMrlfHbzoOpe95xtmKZm0KNyGA1Zty2lL9MOSiVQ8z13kbOwXPAKjpMGct7L4qrN/Ow59b7J3/Xm1WOPC+1Gkd+inP74skJkP2/tlVjlxKZbrEBnYMTHcKLOQjFGVdi9+RgH/uxdjCOKg9ZfOWCjDAMVQKlhKS59jAvg3T9aW/Y9FW81lXVkxG1gKgtjIjpWJnJ61RcRfh07184TO6f0+vbRDLZmVEOns5Nv0H3wxLEL2oJv1nZqd7wQJvUImd4CUZ/yV0Db/kYDWwkqqFALiWBblhp7e5A1Xcy1PgMX063a3EC3B1TTkSjv8nwh1UVzyoqBqOw9gIwzbKQzpT6eF+9UjklfzOfuTPGHbbCng8qmvcgBUHHbPtMQgrtMwgIePowY6pQGA05IJdI4Js3qhwQQxeYCI7sKIlscqRd9QyGOdfhvzUJDa/b+8t7ojtaEwtDIbqvxpCC7oofUVKXfJdaAQYF01rBpP9tT4XVtrCEvjQNlsqdXI1dCgFQ+nDj3ay3tnCs0wJfugL0LwK64hZ6QuobwXOQInzy3CbRJ2iTBPQPQD4oGOE9O3ZvYc1dpyQJaWEDGt+hYVJ12dk1NTVsO0iwOoIIaweXA="
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