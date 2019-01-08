#!/usr/bin/env bash

. data.sh

cd sam-app

set -x

sam build || exit $?

cd hello-world
npm i
cd ..

sam package \
  --template-file template.yaml \
  --output-template-file packaged.yaml \
  --s3-bucket $s3_bucket || exit $?

sam deploy \
  --template-file packaged.yaml \
  --stack-name sam-app \
  --capabilities CAPABILITY_IAM || exit $?
