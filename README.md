This repository is used to integrate GitHub, Terraform and Jenkins to create resources in AWS. 

If you already integrated Jenkins and GitHub, Follow these steps:

1- Create Jenkinsfile to define the pipeline stages. Create terraform  configuration files in the same folder.

2- Assign EC2-Admin Role to the Jenkins-Server. 

3- Go to "Manage Jenkins" > "System Configuration" > "Plugins" ; find "Pipeline:AWS Steps" under "Available Plugins" and install it.

4- Go to "Manage Jenkins" > "Security" > "Credentials" > "Global Credentials" and add a new credential by using your AWS Access Key and Secret Key. It will give permission to Jenkins to create resources in AWS.

5- Depending on your choice, either "Build Now" on Jenkins or Push your codes to GitHub to trigger the build.
