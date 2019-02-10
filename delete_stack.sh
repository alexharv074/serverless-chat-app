#!/usr/bin/env bash

. data.sh

cd chat-app

set -x

aws cloudformation delete-stack --stack-name ChatApp
