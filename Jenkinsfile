pipeline {
    agent any
    parameters {
      choice(
        choices: ['hello' , 'bye'],
        description: 'Test choice',
        name: 'select_choice'
      )
    }
    stages {
        stage('terraform_ec2') {
            steps {
                dir('ec2') {
                    echo "Ready to go!"
                    echo "Running terraform init" 
                    sh 'terraform init'
                }
            }
        }

        stage('pwd') {
            steps {
                dir('testfolder') {
                  sh "pwd"
                }
            }
        }

        stage('call_parameter') {
            steps {
                echo expression { param.select_choice} 
            }
        }
    }
}