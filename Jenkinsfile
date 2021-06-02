pipeline{
    agent any
    tools {
        terraform 'terraform-0.15.3'
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages{
        stage('Git Checkout'){
            steps{
                git 'https://github.com/mushatov-gd/aws-terraform'
            }
        }
        stage('AWS Configure'){
            steps{
                sh '''
                    aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
                    aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
                    aws configure set default.region us-east-2
                '''
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}