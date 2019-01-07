#!/usr/bin/env bash

. data.sh

aws s3 cp _site s3://$s3_bucket/ --recursive
