#!/usr/bin/env bash

. data.sh

aws s3 rb s3://$s3_bucket/ --force
