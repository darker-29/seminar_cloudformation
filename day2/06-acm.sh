#!/bin/bash

source ./.env

CFN_STACK_NAME=${ENV}-acm
CFN_TEMPLATE=$PWD/acm.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --parameter-overrides Parameterkey=Env,ParameterValue=${ENV}
    parameterkey=Domain,parametervalue=${Domain}

exit 0
