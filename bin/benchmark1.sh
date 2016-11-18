#!/bin/bash

if [ -z $DELAY ]; then
  DELAY=0
fi

echo "-> benchmark1"
GOOD=0
echo "test test test..."; sleep $DELAY
echo "test test test..."; sleep $DELAY

exit $GOOD
