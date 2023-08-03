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
    // stage('slack notification') {
    //   steps {
    //     slackSend color: 'good', message: 'success message'
    //     // slackSend botUser: true, 
    //     // channel: 'builds', 
    //     // color: '#00ff00', 
    //     // message: 'Testing Jekins with Slack', 
    //     // tokenCredentialId: 'slack-token'
    //   }
    // }
    post {
        success {
            script {
                slackSend color: 'good', message: "Mustafa's job was successful! :tada:"
            }
        }
    }
  }
}

// curl -X POST -H 'Content-type: application/json' --data '{"text": "Something important"}'  https://hooks.slack.com/services/YOUR/TOKENIZED/URL
