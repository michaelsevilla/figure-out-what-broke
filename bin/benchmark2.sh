#!/bin/bash

if [ -z $DELAY ]; then
  DELAY=0
fi

echo "-> benchmark2"
GOOD=0
echo "test test test..."; sleep $DELAY
echo "test test test..."; sleep $DELAY

exit $GOOD
