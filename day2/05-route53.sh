#!/bin/bash

source ./.env

CFN_STACK_NAME=${ENV}-network
CFN_TEMPLATE=$PWD/network.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --parameter-overrides Parameterkey=Env,ParameterValue=${ENV}

exit 0
