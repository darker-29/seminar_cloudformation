@#!/bin/bash

source ./.env

CFN_STACK_NAME=${ENV}-autoscaling
CFN_TEMPLATE=$PWD/autoscaling.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --parameter-overrides \
    Parameterkey=Env,ParameterValue=${ENV} \

exit 0
