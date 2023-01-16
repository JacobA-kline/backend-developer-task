#!/bin/bash

# Author: Jacob Kline
# Date: 16/01/23
# Last Modified: 16/01/23

# Description:
# Test for app endpoint @ http://localhost/user-management/


curl -I https://www.google.com
status_code=$?
if [ $status_code -ne 0 ]; then
  echo "Error: Unexpected status code $status_code"
  exit 1
fi
