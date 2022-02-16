@#!/bin/bash

source $PWD/.env

CHANGESET_OPTION="--no-execute-changeset"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
fi

CFN_STACK_NAME=${ENV}-alb
CFN_TEMPLATE=$PWD/alb.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides \
    Env=${ENV}

exit 0
