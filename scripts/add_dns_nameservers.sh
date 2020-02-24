#!/bin/sh

parse_and_fix_name_servers(){
  ns=$1
  fixed_json=$(echo -n "${name_servers/', ]'/' ]'}")
  fixed_ns="${fixed_json//'.com.'/'.com'}"

  echo $fixed_ns | jq ".+${OTHER_NAMESERVER}"
}

name_servers=$(echo -n $(terraform output name_servers))

curl -u "${DOMAIN_SERVICE_USERNAME}:${DOMAIN_SERVICE_API_TOKEN}" \
    "${DOMAIN_SERVICE_URL}/v4/domains/med.codes:setNameservers" \
    -X POST \
    --data "{\"nameservers\":$(parse_and_fix_name_servers name_servers  | tr -d ' ')}"