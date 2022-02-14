#!/bin/bash

source $PWD/.env

CFN_STACK_NAME=${ENV}-ec2
CFN_TEMPLATE=$PWD/ec2.yml

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
