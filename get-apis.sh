#!/usr/bin/env bash

echo "APIs:"
aws apigateway get-rest-apis | tee rest_apis.json

rest_api_ids=$(jq -r '.items[].id' \
  rest_apis.json 2> /dev/null || true)

for rest_api_id in $rest_api_ids ; do

  echo "API resources:"
  aws apigateway get-resources \
    --rest-api-id $rest_api_id | tee resources.json

  resource_ids=$(jq -r '.items[].id' resources.json)

  for resource_id in $resource_ids ; do

    methods=$(jq -r --arg id $resource_id \
      '.items[] | select(.id == $id) | .resourceMethods | keys | @tsv' \
        resources.json 2> /dev/null || true)

    for method in $methods ; do

      echo "API method $method:"
      aws apigateway get-method --http-method $method \
        --resource-id $resource_id --rest-api-id $rest_api_id | \
          tee methods-$resource_id-$method.json

    done
  done

  echo "API models:"
  aws apigateway get-models \
    --rest-api-id $rest_api_id | tee models.json
done

rm -f rest_apis.json resources.json methods*json models.json
