#!/bin/bash

source ./.env

CHANGESET_OPTION="--no-execute-changeset"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
fi

CFN_STACK_NAME=${ENV}-rds
CFN_TEMPLATE=$PWD/rds.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides \
    Env=${ENV} \
    DBInstanceType=${DB_INSTANCE_TYPE} \
    DBMasterUserName=${DB_USERNAME} \
    DBMasterUserPassword=${DB_PASSWORD} \
    DBName=${DB_NAME}

exit 0
