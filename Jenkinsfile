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
          script {
            dir('app_infra') {
              echo "Running terraform ${params.SELECT_CHOICE}"
              sh "terraform ${params.SELECT_CHOICE} --auto-approve"
              script {
                def tf_output = sh(returnStdout: true, script: """terraform output instance_private_ip | tr -d '"' """)
                env.IP_ADDR = "${tf_output}"
                echo "${env.IP_ADDR}"
              }
            }
          }
        }
      }
    
      stage('notify-infrabuild') {
        when {
          expression { params.SELECT_CHOICE == "apply"}
        }
        steps {
          slackSend(color: "good", message: " Hey <@$userId> ! Mustafa's Infra built successfully ! :tada:" )
        }
      }

      // stage('read-tf-output') {
      //   steps {
      //     script {
      //         // Reading the Terraform output from the environment variable in stage "tf-apply"
      //         echo "The Terraform output in stage tf-apply is: ${IP_ADDR}"
      //     }
      //   }
      // }

      stage('SSH Remote-host') {
        when {
          expression { params.SELECT_CHOICE == "apply" }
        }
        steps {
            sleep(time: 2, unit: 'MINUTES')
            sh 'ssh -o StrictHostKeyChecking=accept-new -tt ubuntu@${IP_ADDR} "sudo apt install nginx -y"'
        }
      }

      stage('notify-app_build') {
        when {
          expression { params.SELECT_CHOICE == "apply"}
        }
        steps {
          slackSend(color: "good", message: " Hey <@$userId> ! Your App_build run successfully ! :tada:" )
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
      stage('notify-tf-destroy') {
        when {
          expression { params.SELECT_CHOICE == "destroy"}
        }
        steps {
          slackSend(color: "good", message: " Hey <@$userId> ! Your Infra_destroy run successfully ! :tada:" )
        }
      }
    }

    post ('Post Actions') {
      success {
        echo '### Send Slack Notification ###'
        slackSend(color: "good", message: " Hey <@$userId> ! Your Pipeline run succesfully ! :tada:" )
      }
      failure {
        echo '### Send Slack Notification ###'
        slackSend(color: "good", message: " Hey <@$userId> ! Your Pipeline failed ! :scream: , Please Troubleshoot!" )
      }
      always {
        echo '### Clean Workspace ###'
        cleanWs()
      }
    }
}  