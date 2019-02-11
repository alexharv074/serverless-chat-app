#!/usr/bin/env bash

. data.sh

cd chat-app

set -x

aws cloudformation delete-stack --stack-name $stack_name
aws cloudformation wait stack-delete-complete --stack-name $stack_name
