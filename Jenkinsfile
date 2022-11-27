properties([
  parameters([choice(choices: ['dev', 'qa', 'local', 'prod', 'uat'], description: 'Please choose an env', name: 'env')]
  )])
pipeline {
    agent any 
    stages {
        // stage('Git Checkout') { 
        //     steps {
        //         git branch: 'main', url: 'git@github.com:ekanatbekov/AWS_VPC.git'
        //     }
        // }
        stage('Terraform init Plan') { 
            steps {
              withEnv(["env_name=${params.env_name}"]) {
                script {
                    sh 'wget  https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_amd64.zip && unzip terraform_1.2.7_linux_amd64.zip'
                    sh 'terraform version'
                    sh  'terraform init -backend-config=env/config.npe.tfbackend'
                    sh 'terraform plan -var-file=env/dev.tfvars'
                }
            }
          }
        }
        stage('Good to go ?') {
            steps {
               input message: 'Good to go? (CLick "Proceed" to continue)'  
            }
        }
        stage('Terraform apply') {
            steps {
              sh 'terraform apply -var-file=env/dev.tfvars -auto-approve'
            }
        }
    }
}