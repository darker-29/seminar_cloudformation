#!/bin/bash

source $PWD/.env

bash 10-network.sh
bash 20-ec2.sh
bash 30-rds.sh

exit 0
