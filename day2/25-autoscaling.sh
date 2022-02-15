@#!/bin/bash

source ./.env

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
    --parameter-overrides \
    Parameterkey=Env,ParameterValue=${ENV} \

exit 0