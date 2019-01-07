#!/usr/bin/env bash

# Based on:
#  https://medium.freecodecamp.org/how-to-host-a-website-on-s3-without-getting-lost-in-the-sea-e2b82aa6cd38

. data.sh

policy() {
  cat <<EOF
{
  "Version": "2008-10-17",
  "Id": "PolicyForPublicWebsiteContent",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::$s3_bucket/*"
    }
  ]
}
EOF
}

policy > policy.json ; set -x

aws s3 mb s3://$s3_bucket/

aws s3 website s3://$s3_bucket/ \
  --index-document index.html \
  --error-document error.html

aws s3api put-bucket-policy \
  --bucket $s3_bucket \
  --policy file://policy.json

rm -f policy.json
