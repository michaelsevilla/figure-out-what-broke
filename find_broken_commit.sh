#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Please pass me a delay (controls how fast the demo is)"
  echo "USAGE: $0 <delay>"
  exit 1
fi

bin/setup.sh $1
bin/test.sh $1
bin/cleanup.sh
