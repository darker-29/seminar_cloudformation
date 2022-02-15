#!/bin/bash

source ./.env

CHANGESET_OPTION="--no-execute-changeset"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
fi


CFN_STACK_NAME=${ENV}-route53
CFN_TEMPLATE=$PWD/route53.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --parameter-overrides parameterkey=env,parametervalue=${env} \
    parameterkey=Domain,parametervalue=${Domain}


exit 0
