#!/bin/bash

source $PWD/.env

CHANGESET_OPTION="--no-execute-changeset"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
fi

CFN_STACK_NAME=${ENV}-autoscaling
CFN_TEMPLATE=$PWD/autoscaling.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides \
    Env=${ENV} \
    KeyName=${EC2_KEY_NAME} \ 
    EC2AMIID=${EC2_AMI_ID} \
    EC2InstanceType=${EC2_INSTANCE_TYPE}

exit 0
