properties([
    parameters(
        [choice(choice:['dev', 'qa', 'uat', 'prod', 'local'], description: 'please select environment' name: 'env_name')]
    )
])

node('master') {
    stage('Set up the agent') {
        if (params.env_name == ''){
            params.env_name == 'dev'
        }
        currentBuild.displayName = "${params.env_name}"
        currentBuild.discription = "Applying changes to the ${params.env_name} environment"
        if(params.env_name == "dev" || params.env_name == "qa" || params.env_name == "local"){
            agent_label = "tf-ews-pe-dcc-dev-npe"
        }
        else 
        agent_label = "prod-deploy-pod-tf-ews-pe-dcc-prd" 
    }
}

pipeline {
    agent any 
    stages {
        stage('Git Checkout')
          steps{
            git branch: 'main', url: 'git@github.com:ekanatbekov/AWS_VPC.git'
          }
        stage('Terraform Plan')
          steps{
            withEnv(["env_name=${params.env_name}"]) {
                script {
                    sh 'wget --quite https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_amd64.zip && unzip terraform_1.2.7_linux_amd64.zip'
                    sh './terraform version'
                    sh(script: '''#!/bin/bash
                    if [$env_name != "uat" ] || [$env_name != "prod"]
                    then
                      ./terraform init -backend-config=env/config.npe.tfbackend
                    else 
                      ./terraform init -backend-config=env/config.prod.tfbackend
                    fi
                    '''.scriptIndent())
                }
            }
          }
    }
}