#!/bin/bash

source ./.env

CHANGESET_OPTION="--no-execute-changeset"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
fi

CFN_STACK_NAME=${ENV}-acm
CFN_TEMPLATE=$PWD/acm.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --parameter-overrides Parameterkey=Env,ParameterValue=${ENV}
    parameterkey=Domain,parametervalue=${Domain}

exit 0
