pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIASKRH5RYAFBOF4B22"
export AWS_SECRET_ACCESS_KEY="rJJvW5+xq+4oVXf4BEQm65EtASvaAgnbqwHsyT8I"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAcaDGV1LWNlbnRyYWwtMSJIMEYCIQD2MBHnYEuyDZV/dzCqKsxhduZwRNA5x/7FvVWSGX5jMQIhAN4MUSHlr+RjxgZeRTzlwR34TWkL3Z5sMz1eXLTH2fcOKqMDCDAQBBoMMTYwMDcxMjU3NjAwIgy5LzIq0JvTTtoA9W0qgAPlM1PLT8eURiX4NLMj6NUlNdPXJ17DTsY+SRHkOqjMWVJZLiDV20Y4q1Fyn0zLoZehhfwcztAt2lNstonkeBPzFynLit6g5d6jYUzAIzi5Xf08FamMLYZsAJipU1nlvdJ/GEvAsp88a1iehpVjxpEcKTViWXYKNfFl9Vnd3vgicH7E5naiqBDI8/6kRCXLb8s0nhW8Kx7Nj9ULX0xBtUeHVjqFLvmtoeZ1Cso/ZaFovorpqo9uDWHM/7a8Ep0Zdvkh/dsx96PK9NFdmVGhyfLFzFsRV+vq2Is39BqEOrEvKxc8mXGoGKba5FoMZRYqJV2PugfTI2aInzj+uD5GUbgrr1XmqOkuupBXb5cXosuv0c4pFwb/tt9VPoMfqfc1blMLKwF2/fnkJNemXL5NcQ+3fK5g/lf53LSsLKzCeSfQOQG45Ujs25wha1wM8jNUcSqqXyVl4kllUPQMxhzu+S8zDg2JeIJ+cljaC7hs7lQNJ77YWhIzat+zN9Qd88WFwOIwub2OowY6pQGUZygCihf162vW0l1w4JkE1dTl+F9F0ljUTfGm4LT6rBSA8ow0QFc2Dv/x7xnl8e/fD4WwQdRx6q67EVgt9KwCS6kkpqz8Ggi8ReWdhhqok4VJpky5X5PwAgVU7elcugrqHfpVBwqRWgS9MCqFPfpXi2SMZJGnu2VttdyVyAyBDWlFDQMB8IEdoSqHVPOkhtr7XMUAXVJpqPWBCebCR8kHgXdWVhA="
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