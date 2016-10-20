# !/bin/bash

DATE=$(date '+%Y-%m-%d:%H:%M:%S')
DIR_NAME="carmaise-dir-$(date '+%Y-%m-%d')"

#Assumes you have installed, configured the aws cli and installed jq - The JSON parser
#https://stedolan.github.io/jq/download/
#http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-bundle-other-os

SG_NAME="carmaise-server-sg-$DATE"

#Create a security group and use JQ to parse the SG GROUP ID returned
SG_GROUP_ID=$(aws ec2 create-security-group --group-name $SG_NAME --description "CARMAISE server security group created at $DATE" | jq .GroupId | tr -d '"')

aws ec2 authorize-security-group-ingress --group-id $SG_GROUP_ID --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $SG_GROUP_ID --protocol tcp --port 443 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $SG_GROUP_ID --protocol tcp --port 3306 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $SG_GROUP_ID --protocol tcp --port 22 --cidr 0.0.0.0/0

echo $SG_NAME
aws ec2 describe-security-groups --group-names $SG_NAME > $DIR_NAME/$SG_NAME.json
