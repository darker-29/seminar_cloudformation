#!/bin/bash

source ./.env

CFN_STACK_NAME=${ENV}-network
CFN_TEMPLATE=$PWD/network.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-body file://${CFN_TEMPLATE}
    --parameter-override \
    Parameterkey=Env,ParameterValue=${ENV} \

exit 0
