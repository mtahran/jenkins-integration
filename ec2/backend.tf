terraform {
  backend "s3" {
    bucket = "mustafat-terraform-backend-file"
    key    = "jenkins/jenkins_pipeline/terraform.tfstate"
    region = "us-east-1"
  }
}