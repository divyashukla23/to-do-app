pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
export AWS_ACCESS_KEY_ID="ASIASKRH5RYALWNT7H4J"
export AWS_SECRET_ACCESS_KEY="vw9oZFSG7FbNXMG8l1iCdv77EAT6KMmp/Dt6E/Hb"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAcaDGV1LWNlbnRyYWwtMSJIMEYCIQDrmYMqHtiQ38G0rv13kh+UqBaLz3j/qWpNMWIKoRL+WQIhANb8vR+4iExqNRaLG3SjyAg7/sNqrXjqkkWj60dLy17MKqMDCDAQBBoMMTYwMDcxMjU3NjAwIgwtMKLcf64NdHqbHlAqgAOIUnG6PmeY7zfSSEmO9xuvjSJI4+euSrPyMbfGWpmmJssaNyuKbn3rW12PcC+jJrf2oxugtCm+GknU2Wvg8cX5dPMndDE3MjnV3b9PXuTy55VNyLV2YoYaGnuor46+ZsiGoMsKHqzAEfNw3iSl7XHhBGm/YiCm524gWjuhDIfzfi55Nk+ei3IYMscR+hoOGwSv5jy1FZcg/cemRefQQm0nLLGFWx+2zWWd7XeDe5jqwXgPmDVA2vtBhkhkvBldXBInkMaBPX7WD+2Xaq4xe+FoR7j3chXEV3z727dQrKuJHWELpQ5aPYMShsjWWNZrrDBVmzv/Udflxr7QCbrSzXOdk0RUFO9AVo57/DvuMPu2v3q0HZOs3WiDQyC3liZjshOsKCasPVTiXgIwEiWOQuB5QVFCvUz/25000R+AMkf+Mx2cca8mRtyKM6ATO97euST+scZm/T3ZBngMwKvPVE5e/GMbPRLTACmkH37yc8EqRG9aMXvs//EzUTKHXe574TowtbyOowY6pQEZ0kOBC7MHnpq/dN0RMcUXBELmIywdaY91iiXiJEL974GKILR5UJmHxXmL3EquD/DV7JmFgjBmBJXon34ODP38yd0lSEFlpw/96vdIWzJUpKUKXHe+s8m045rCjOQG33UOmn74nZ4ABhGtjw4y+aQDmqjM9DBI15joPr8RFan22KbxzoLbXXgY6T5TGHKZM3ioWKwnzT0Dw9XRVhzQebcHCgVGHxc="                   
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