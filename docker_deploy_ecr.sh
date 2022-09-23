echo ' Please make sure to execute this script within your project folder and that it contains the required Dockerfile for deployment '
sleep 1s
echo ' Enter the name for your ECR image: '
read ECR_NAME

ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)
REGION=$(aws ec2 describe-availability-zones --output text --query 'AvailabilityZones[0].[RegionName]')

echo ' Pushing Docker Image to ECR '
docker login -u AWS -p $(aws ecr get-login-password --region $REGION) $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker build -t $ECR_NAME .
docker tag $ECR_NAME:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$ECR_NAME:latest
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$ECR_NAME:latest

