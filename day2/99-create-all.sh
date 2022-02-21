#!/bin/bash

source $PWD/.env

if [ $# = 1 ] && [ $1 != "deploy" ]; then
  echo "deploy mode"
  ARGMENT=""
fi

bash 05-route53.sh ${ARGMENT}
bash 06-acm.sh ${ARGMENT}
bash 10-network.sh ${ARGMENT}
bash 20-ec2.sh ${ARGMENT}
bash 25-autoscaling.sh ${ARGMENT}
bash 26-alb.sh ${ARGMENT}
bash 30-rds.sh ${ARGMENT}

exit 0
