#!/bin/bash
#aws-vault exec diego -- aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 296888759146.dkr.ecr.us-east-1.amazonaws.com
docker build -t rails-demo-repo .
docker tag rails-demo-repo:latest 296888759146.dkr.ecr.us-east-1.amazonaws.com/rails-demo-repo:latest
docker push 296888759146.dkr.ecr.us-east-1.amazonaws.com/rails-demo-repo:latest
aws-vault exec diego -- aws --region=us-east-1 ecs register-task-definition --cli-input-json file://task.json


#aws-vault exec diego -- aws --region=us-east-1 ecs run-task --cluster arn:aws:ecs:us-east-1:296888759146:cluster/ECSStack-APIclusterC73889FE-pALIw6tuFoW7 --task-definition rails-task --count 1 --launch-type FARGATE --network-configuration "awsvpcConfiguration={subnets=[subnet-0e70470b66cdc65de],securityGroups=[rails--6785]}"

aws-vault exec diego -- aws --region=us-east-1 ecs run-task --cluster arn:aws:ecs:us-east-1:296888759146:cluster/ECSStack-APIclusterC73889FE-pALIw6tuFoW7 --task-definition rails-task --count 1 --launch-type FARGATE --network-configuration "awsvpcConfiguration={subnets=[subnet-0e70470b66cdc65de],securityGroups=[sg-0161859e201a236f1],assignPublicIp=ENABLED}"