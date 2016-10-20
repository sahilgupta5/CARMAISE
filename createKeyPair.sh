#!/bin/bash

DATE=$(date '+%Y-%m-%d:%H:%M:%S')
DIR_NAME="carmaise-dir-$(date '+%Y-%m-%d')"

#Assumes you have installed, configured the aws cli and installed jq - The JSON parser
#https://stedolan.github.io/jq/download/
#http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-bundle-other-os

KEY_PAIR_NAME=carmaise-kp-$DATE

mkdir $DIR_NAME

aws ec2 create-key-pair --key-name $KEY_PAIR_NAME --query 'KeyMaterial' --output text > $DIR_NAME/$KEY_PAIR_NAME.pem
chmod 400 $DIR_NAME/$KEY_PAIR_NAME.pem
echo $KEY_PAIR_NAME
