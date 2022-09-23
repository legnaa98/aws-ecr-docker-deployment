# aws-ecr-docker-deployment
This repo contains a script to execute all of the required commands in order to deploy a Docker image to AWS ECR with the `latest` tag.

# Usage
In order to push a docker image to ECR you should copy the `docker_deploy_ecr.sh` file to your project directory, make sure to have your `Dockerfile` within the same folder as the script.

## 0. Create the ECR repository
Before running anything make sure to have a repository to which you'll push the docker image and copy it's name somewhere, you'll need it later. You can either do this through 
* [AWS Management Console ](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-console.html)
* [AWS CLI](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html) or,
* [CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ecr-repository.html)

The ECR Repository creation step could be added as part of the script `docker_deploy_ecr.sh` using the AWS CLI commands but the initial idea was to use this in a test phase where you have to push your image several times to an existing repository to test for new changes, so the ECR repository creation is assumed to be made by now.
## 1. Setting up AWS credentials
Make sure to have your AWS account authenticated in the machine that will run the code in order for it to be able to run AWS CLI commands. For more information on that visit [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html).

## 2. Run deployment script
Once you have authenticated the AWS account that will host the docker image you can run the script by simpy running
```
sh docker_deploy_ecr.sh
```
the script will prompt you for the ECR Repository name
```
 Please make sure to execute this script within your project folder and that it contains the required Dockerfile for deployment 
 Enter the name for your ECR image: 
my-test-ecr
```
this will execute all necessary commands to build, tag and push your docker image to the `my-test-ecr` repository which otherwise would have to be ran one by one.