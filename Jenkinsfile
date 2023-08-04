def userId_cto = slackUserIdFromEmail('fahriddin24@gmail.com')
def userId_admin1 = slackUserIdFromEmail('tuba_7655@icloud.com')
def userId_admin2 = slackUserIdFromEmail('Burkanov.es@gmail.com')

pipeline {
  agent any
  parameters {
    choice(
      choices: ['apply' , 'destroy'],
      description: 'Terraform Action',
      name: 'SELECT_CHOICE'
    )
  }
  stages{
    stage('tf-init') {
      when {
        branch 'main'
      }
      steps {
        dir('app_infra') {
          echo "Running terraform init"
          sh 'terraform init'
        }
      }
    }

    stage('tf-validate') {
      steps {
        dir('app_infra') {
          echo "Running terraform validate"
          sh 'terraform validate'
        }
      }
    }

    stage('tf-fmt') {
      steps {
        dir('app_infra') {
          echo "Running terraform fmt"
          sh 'terraform fmt'
        }
      }
    }

    stage('tf-plan') {
      steps {
        dir('app_infra') {
          echo "Running terraform plan"
          sh 'terraform plan'
        }
      }
    }

    stage('tf-action') {
      steps {
        dir('app_infra') {
          echo "Running terraform ${params.SELECT_CHOICE}"
          sh "terraform ${params.SELECT_CHOICE} --auto-approve"
        }
      }
    }
  }

  post ('Post Actions') {
    success {
      echo '### Send Slack Notification ###'
      slackSend(color: "good", message: " Hey <@$userId_cto> ! Mustafa's 'Pipeline GitHubIntegrate-2' status 'success' :tada:" )
    }
    failure {
      echo '### Send Slack Notification ###'
      slackSend(color: "good", message: " Hey <@$userId_admin1> and <@$userId_admin2> ! Mustafa's 'Pipeline GitHubIntegrate-2' status 'failure' :scream: , Please Troubleshoot!" )
    }
  }
}