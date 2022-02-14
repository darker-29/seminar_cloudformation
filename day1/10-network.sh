#!/bin/bash

source ./.env

CFN_STACK_NAME=${ENV}-network
CFN_TEMPLATE=$PWD/network.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides Env=${ENV}

exit 0
