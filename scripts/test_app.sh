#!/bin/bash

# Author: Jacob Kline
# Date: 16/01/23
# Last Modified: 16/01/23

# Description:
# Test for app endpoint @ http://localhost/user-management/


curl -I http://localhost/user-management/
status_code=$?
if [ $status_code -ne 200 ]; then
  echo "Error: Unexpected status code $status_code"
  exit 1
fi
