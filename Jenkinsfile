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

                    export AWS_ACCESS_KEY_ID="ASIASIANXU3ZMRBXE6DO"
                    export AWS_SECRET_ACCESS_KEY="fbXhEe2AAj/E8lmJVW9M1BvXWxKwnirUORzPRG/q"
                    export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjECEaDGV1LWNlbnRyYWwtMSJHMEUCIQCPVaXIBsFAUZNOtIA7h/rqRygewEc+iFM+W8kcnmatywIga3uJpK5WZrewXAnQLInWSVbD5PLHKCoU3tVu8QBYRUMqnAMIShACGgwxNTQ2NDc2MzU2OTgiDFtx11CFFvOmIJIweCr5AvHBhqbipgDwBqL7VGteGN6ElpF6V5n4zuOx3pntAJAHTHJsLBQAb+MSeD1QSLjRCDkfDOEEPSpWZSqT0YTvkElEHB6+POC/gTWCXrwI1prmClXT7Tx5XW5hS3lSKVlSr2VSEILOHeQCrLmKu25Dy7uxZfg9nOH1yKPF1JZ97chAABsjXv6q6t8gYAOfPPB5pWHhyJGwWicmVyPQFVgTlAbwiHQd3KpSjElaTwh2DvA+AAtcC4HIYH2rSUVMps+h7zQ8+T/tKAYmbhys5XHaTumLLUABB4wVXCv3eaONvkcvRh6XHbkAOVDJNuH8CVgwuSAxlhKOSJETeN+gn/45RF1Q1NLgHzZnJAiQ4uEOCLhakAALO4SDnjxEB1uI/j4GGuz6uClUD6KVaakcTGXMBFDMCak/LgdK4d4xmwj+e3wMcal9b3PLMjMLN+D/wuK8ZMdQbvnTsvucqbPrFES34Z76SxvW2H91fhDdIKWKxCRp1rflxb6peWrgMP+iyJwGOqYBupzowtsslPz+59bb2u5WejvxULYK62edR1ioPuMImE5G7rzzCXnygG9O4TVPGp//BsseX48n2vTY2CIEGVYKMaIxlFGjCVdeHiSYlkt5XtfzvHG1dMMFwXs7n7T/D0p0G7v5ygKmq9E3LFKvzLr85LkJ4Ltgt3qB0nmzVMxH59PhIeNDjgVwmBGbNkxywvfFYF7EymatR+CDxLERaoh5YJa2JHREkA=="
                    terraform init -upgrade
                    echo "Formatting .tf files"
                    terraform fmt
                    terraform plan
                '''
            }
        }
        // stage('Build'){
        //     steps{
        //         sh '''
        //             echo "Creating Repo, Building Image, Creating EKS cluster, Creating EKS worker nodes"
        //             terraform apply -auto-approve
        //         '''
        //     }
        // }
        // stage('Configuring the cluster with kubectl'){
        //     steps{
        //         sh '''
        //                 echo "Configuring..."
        //                 aws eks --region ap-southeast-1 update-kubeconfig --name todo-app-Cluster
        //         '''
        //     }
        // }
        // stage('Deploy'){
        //     steps{
        //         sh '''
        //                 echo "deploying the application....."
        //                 kubectl apply -f deployment.yml
        //         '''
        //     }
        // }
    }
}