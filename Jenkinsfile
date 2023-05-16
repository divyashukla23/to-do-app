pipeline{
    agent any
    stages{
        stage('Terraform check'){
            steps{
                sh '''
                    echo "Initializing the Terraform"
                    export AWS_ACCESS_KEY_ID="ASIAQN6MMOQGQ5ZFWDDP"
export AWS_SECRET_ACCESS_KEY="aRXKYc6Qr8oUZV6WE8qsGQ1KmkIOMIolxSSoRkWF"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEAgaDGV1LWNlbnRyYWwtMSJIMEYCIQDqhTtjmhiVywzrFIL40YX/wRRMFzGmKCqYBEcrkuMorQIhAI84yFhN1tr5DhFi5uW6Ka/EDNR1xV8d3z2Y3D/6k/uMKqMDCDEQABoMMDI5OTU2NTM1MzA5Igwdoif9hkKQKLNODjQqgAM5t77S7Zr18Oq2pqAgkap6bp4+p9+eOkFkqe8SwCDOrP98LKCgDLyeTHnYxYWZHz2gf4fmwvGB46NVFmAPYZpCcforsyy80Mq8Nn3idPXt76FnVZS070anBhlGLJ17RQ7lEBb3LAI4cijAnnuFUY8S3BC+DZdnBpekjEE+wDCCVzatcsVlTggvTZJD3B1KIx2GhJQGlM3Zb/p5whT0UlIvOShNLJB+y7OgrItrMgai8mo8SR1U/RYFtGb3SLExrEhdjVN58XR1IAUL5aFw6R+AniiXRAl59ihvPS7iff31HWkscsY71ZjwnCb/vCe0yTepme1Mr+eZV9p0Sgz2/iQ6OhOKRMWBAix4z/h0kQuISMg35ZDDxMCMDWrkTRgEV1QxEcziBKM+q1Tsyri4d7k3UCxwuzj5LWhc6VvhXtl8woekbR7rNhApXFL+eUNCxQgpL7duYe+sjzUr/wGLc0wl61K3OWg/25WfhbfJInoOdc4sefedNEa1sayYfzEty84w5seOowY6pQF9KAPCyaUru+mbOnNXJMSmSWcwf+5xOOXksIu12EGE3bnjjFbSB0H95445/kYnM/s5NrBKBRbcoKdPtEgg3eq+PC+nN1CZsMf2JvhJCjGE+tcqOdcK6f+dL4VoiTuBT/C6m1TwgSPJZm7ZUGmG1ih+sTCwjvDcGCcqQenVyTLwhTZoWavl81iU3z4m0976JPLd/fWKZXgX0+4HSgFBEGdeIPnJTQI="
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