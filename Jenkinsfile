pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
export AWS_ACCESS_KEY_ID="ASIASKRH5RYAM6EXBQEP"
export AWS_SECRET_ACCESS_KEY="MjRL/K0fLl0xtnsJbgEcuLodYM6xxnT9JtCCDnnl"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAcaDGV1LWNlbnRyYWwtMSJHMEUCIQCHhswDanrhB77LJSBtQyIp2MU2UxFpFtYUE1i5a/8uogIgWVYtk/0XYdaAXUYUs9fdDN+cdcgEgP40Qi8fP9CuCaAqowMIMBAEGgwxNjAwNzEyNTc2MDAiDJ5Gdl1c0Z1uqufYUiqAA4Kd6rvcHaKbFRXtgJWzGzuxaA8d268Y6zTXZRMTcWJnn4ZfktvUL3sVEynBC/6czTiZ9Pt9t92eHB1IKhIsY9UK9HxHIuNZylSElGJWZO5y+Goa2GK9TzRTvktXTnPlHM0xVJwS23c1Nsa7h/NLtWhpBtboy31iELYF07yTiHJIcv+WuXRgBP5wcRgr4tQUQLBAJIOSjkFzPyQxsYrhOEOm7LPbwQqg0kZV+f8t9btvu8DBNh36iyOE6GM2CFIiirLUJ2zo8zIkVni8epTm9NvWrryltmtgD+I16QXo/J6tV6dRoqg9QpfRJXdCR7hEjJ1ONXyYiU9XvgQ8QcEqd4iS6uGlsm3unTfrqc9eCKOg8X2A/C+f2Pr37F/93mrXk7fdoyOTIB312k7dign/Yk9tmy/7vt5nHjtwPbWX3SXPq+Cd6mWuxhnlNvIAVbXstpiYaEO9MC3qbhokewlviMai0KH+12/e4MzXdsb0KzgB8vd4CZBIBnIkQ98Lx6tgVTCZtI6jBjqmAcB4Guk4VV6OOcCkR4mBgbxldcN4eSYFwopDWYsuIfGEO77gO+/Bq5oU/nduE+kaKrT4xP67wSsW97ahs88L4qGJziEqbNkUT6OEROEsjjl+O0GGkwOpZq2iebWEOohGcQeQrsYHTIXaSUBxaobFVEVjYps7RK2tnalrQY9I+b6eva4bNECaUPRvLiYKjUxQKMeOCgIGXBOBe8zQBYP5UuORmEcnjLM="                    terraform init
                    echo "Formatting .tf files"
                    terraform -version
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