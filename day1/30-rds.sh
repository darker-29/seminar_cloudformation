@#!/bin/bash

source ./.env

CFN_STACK_NAME=${ENV}-rds
CFN_TEMPLATE=$PWD/rds.yml

aws cloudformation deploy \
    --stack-name ${CFN_STACK_NAME} \
    --template-file ${CFN_TEMPLATE} \
    --parameter-overrides \
    Parameterkey=Env,ParameterValue=${ENV} \
    Parameterkey=DBInstanceType,ParameterValue=${DB_INSTANCE_TYPE} \
    Parameterkey=DBMasterUserPassword,ParameterValue=${DB_PASSWORD} \
    Parameterkey=DBMasterUserName,ParameterValue=${DB_USERNAME} \
    Parameterkey=DBName,ParameterValue=${DB_NAME} \

exit 0
