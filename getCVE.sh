#!/bin/bash

curl https://cve.circl.lu/api/cve/${1}  --silent | jq ' .vulnerable_product[]' | awk -F":" '{print $4,$5,$6}'
apt list --installed 2>/dev/null  | grep "${VUN_APP}" | awk -F'/' '{print $1, $2}' | awk '{print $1, $3}' | awk -F'-' '{print $1}'
