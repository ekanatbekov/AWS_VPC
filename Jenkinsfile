properties([
  parameters([choice(choices: ['dev', 'qa', 'local', 'prod', 'uat'], description: 'Please choose an env', name: 'env')]
  )])

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