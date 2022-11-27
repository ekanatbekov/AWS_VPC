properties([
  parameters([choice(choices: ['dev', 'qa', 'local', 'prod', 'uat'], description: 'Please choose an env', name: 'env')]
  )])
pipeline {
    agent any 
    stages {
        stage('Git Checkout') { 
            steps {
                git branch: 'main', url: 'git@github.com:ekanatbekov/AWS_VPC.git'
            }
        }
        // stage('Terraform init Plan') { 
        //     steps {
        //       withEnv(["env_name=${params.env_name}"]) {
        //         script {
        //             sh 'wget --quite https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_amd64.zip && unzip terraform_1.2.7_linux_amd64.zip'
        //             sh '/terraform version'
        //             sh(script: '''#!/bin/bash
        //             if [$env_name != "uat" ] || [$env_name != "prod"]
        //             then
        //               terraform init -backend-config=env/config.npe.tfbackend
        //             else 
        //               terraform init -backend-config=env/config.prod.tfbackend
        //             fi
        //             '''.scriptIndent())
        //         }
        //     }
        //   }
        // }
        // stage('Good to go ?') {
        //     steps {
        //        input message: 'Good to go? (CLick "Proceed" to continue)'  
        //     }
        // }
        // stage('Terraform apply') {
        //     steps {
        //       sh 'terraform apply -auto-approve'
        //     }
        // }
    }