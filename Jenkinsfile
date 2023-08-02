pipeline {
    agent any
    parameters {
      choice(
        choices: ['apply' , 'destory'],
        description: 'Terraform Action Choice',
        name: 'select_action_choice'
      )
    }

    stages {
        stage('terraform_init') {
            steps {
                dir('ec2') {
                    echo "Running terraform init" 
                    sh 'terraform init'
                }
            }
        }

        stage('terraform_validate') {
            steps {
                dir('ec2') {
                    echo "Running terraform validate" 
                    sh 'terraform validate'
                }
            }
        }

        stage('terraform_plan') {
            steps {
                dir('ec2') {
                    echo "Running terraform plan" 
                    sh 'terraform plan'
                }
            }
        }

        stage('terraform_action') {
            steps {
                dir('ec2') {
                    echo "Running terraform ${params.select_choice}" 
                    sh "terraform ${params.select_choice} --auto-approve"
                }
            }
        }
    }
}