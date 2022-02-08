@#!/bin/bash

source ./.env

CFN_STACK_NAME=${ENV}-ec2
CFN_TEMPLATE=$PWD/ec2.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-body file://${CFN_TEMPLATE}
    --parameter-override \
    Parameterkey=Env,ParameterValue=${ENV} \
    Parameterkey=KeyName,ParameterValue=${EC2_KEY_NAME} \
    Parameterkey=EC2AMIID,ParameterValue=${EC2_AMI_ID} \
    Parameterkey=EC2InstanceType,ParameterValue=${EC2_INSTANCE_TYPE} \

exit 0
