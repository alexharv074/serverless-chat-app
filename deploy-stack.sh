#!/usr/bin/env bash

. data.sh

cd chat-app

set -x

sam build || exit $?

sam package \
  --output-template-file packaged.yaml \
  --s3-bucket $s3_bucket || exit $?

sam deploy \
  --template-file packaged.yaml \
  --stack-name $stack_name \
  --capabilities CAPABILITY_IAM || exit $?
