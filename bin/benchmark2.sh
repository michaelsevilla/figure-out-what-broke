#!/bin/bash

if [ -z $DELAY ]; then
  DELAY=0
fi

echo "-> benchmark2"
GOOD=0
echo "test test test..."; sleep $DELAY
GOOD=1
echo "test test test..."; sleep $DELAY

exit $GOOD
