pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQGXIXHMK4M"
                    export AWS_SECRET_ACCESS_KEY="hMh1x8a4o6n2oQGod3XBHrHypS9tO728lzhgaJU7"
                    export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAkaDGV1LWNlbnRyYWwtMSJHMEUCIQDnDKkO3HDHDbzoT6rgHYV2w7mucDOJkGXIaBwhihfP4QIgHlpr8zIJvHOZ23fyz++FE7dTcczsWNXsDXn7O467G+QqowMIMxAAGgwwMjk5NTY1MzUzMDkiDIgi3E1tlUW3AoGVdyqAA+Z+WDjr7ky0uKJTprOpHzGFbIuuI6LAahAvyoU9rgBnLzx19mRSupOC491RNEdpwTlKloZbJYb4Dq/edg2MiLQB1aYtTCN/i/8fIppBoieK2ed/wswzleV+eZXlrxLTTikVPJg0mxe8SwUbCWcK4ChbHxB0sZMdaIlliLGExL3s+SXY3IAct6BPZlXiN8t8lvHpyFKdeSngME2/koGX1Q231ys8d5blgICpX/62qO1sYcGTM2V3Oe4jWyK156Lnyl4rUDCGdqV0xI2a96iFzFk/fgTUSv5hIlCm9oxgyBBeYO+JLRmjQ16rsgsgdEfs4lz9Rvps4k+GEubrHrLEbnZZvZyyq5TGifnWsfYV8DYTzQ7dgJeUznp7EUC9U10aKLmhPltcBodCKFrmQ0HSoQIV6h1LKOoIgOr5Vl2qJa+IXsrVP03OpdQQU0JC6Ai6fjRHexogQ/ITF72d6yxjNc0RIQwZqIue/TeCVbMez11136lgAxpKyvaEVLZwD1oeUTDW946jBjqmARrreBp12+RZJZqz2irnbHTR0xg4h6Gc7/Xh1YITf2geepCKc9sAiDLJwDSV8L0q1lqe29jPb0z2xAhIP0f4IUNqRdusQVZJM3JWURu7oZEBi4MkwNqWckfd3R1an2+ykTTeOvM5k/5vu5st2FGgDpE81Q+UcyZHkI92aQIBUJem0aQQnTDWMMao4jrN8ybO8xb5YysgwvAGRjpfvqqpY/UPalBCbrY="
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