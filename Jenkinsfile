def userId = slackUserIdFromEmail('mutahran@gmail.com')
  
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
  
      stage('tf-apply') {
        when {
          expression { params.SELECT_CHOICE == "apply"}
        }
        steps {
          dir('app_infra') {
            echo "Running terraform ${params.SELECT_CHOICE}"
            sh "terraform ${params.SELECT_CHOICE} --auto-approve"
            sh "terraform output"
          }
        }
      }
      stage('tf-destroy') {
        when {
          expression { params.SELECT_CHOICE == "destroy"}
        }
        steps {
          dir('app_infra') {
            echo "Running terraform ${params.SELECT_CHOICE}"
            sh "terraform ${params.SELECT_CHOICE} --auto-approve"
          }
        }
      }
    
      stage('notify-infrabuild') {
        steps {
          slackSend(color: "good", message: " Hey <@$userId> ! Mustafa's infrabuild status: 'success' :tada:" )
        }
      }

      // post ('Post Actions') {
      //   success {
      //     echo '### Send Slack Notification ###'
      //     slackSend(color: "good", message: " Hey <@$userId_cto> ! Mustafa's Pipeline - Infra Creation status: 'success' :tada:" )
      //   }
      //   failure {
      //     echo '### Send Slack Notification ###'
      //     slackSend(color: "good", message: " Hey <@$userId_admin1> and <@$userId_admin2> ! Mustafa's Pipeline - Infra Creation status: 'failure' :scream: , Please Troubleshoot!" )
      //   }
      //   always {
      //     echo '### Clean Workspace ###'
      //     cleanWs()
      //   }
      // }
  
      // options { 
      //   quietPeriod(60) 
      // }
  
      // stage('ssh_to_app_server') {
  
  
      // }
  
      // stage('install_nginx') {
  
        
      // }
  
      // post ('Post Actions') {
      //   success {
      //     echo '### Send Slack Notification ###'
      //     slackSend(color: "good", message: " Hey <@$userId_cto> ! Mustafa's Pipeline - Deployment status 'success' :tada:" )
      //   }
      //   failure {
      //     echo '### Send Slack Notification ###'
      //     slackSend(color: "good", message: " Hey <@$userId_admin1> and <@$userId_admin2> ! Mustafa's Pipeline - Deployment status 'failure' :scream: , Please Troubleshoot!" )
      //   }
      //   always {
      //     echo '### Clean Workspace ###'
      //     cleanWs()
      //   }
      // }
    }  
}  