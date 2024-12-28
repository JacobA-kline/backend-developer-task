#!/bin/bash

# Author: Jacob Kline
# Date: 16/01/23
# Last Modified: 18/01/23

# Description:
# Test for app endpoint @ http://localhost/user-management/


curl -I http://localhost/user-management/
status_code=$?
if [ $status_code -ne 0 ]; then
  echo "Error: Unexpected status code $status_code"
  exit 1
fi

curl -I http://localhost:8080/users/all
status_code=$?
if [ $status_code -ne 0 ]; then
  echo "Error: Unexpected status code $status_code for /users/all"
  exit 1
fi