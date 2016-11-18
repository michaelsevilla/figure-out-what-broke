#!/bin/bash
# You can pass in a delay to control how long the demo takes
export DELAY=$1

check() {
  if [ $? -ne "0" ]; then 
    echo "Uh oh - this build is BROKE"
    exit 1
  fi
}

bin/setup.sh 
bin/benchmark0.sh; check
bin/benchmark1.sh; check
bin/benchmark2.sh; check
bin/cleanup.sh

echo ""
echo "Yay - this build is healthy :) :) :)"
exit 0
