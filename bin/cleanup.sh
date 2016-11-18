#!/bin/bash
# must be run from the root directory (e.g., bin/cleanup.sh)

echo "======================"
echo "INFO: cleaning up 3PAR"
cd src >> /dev/null
make clean
cd - >> /dev/null
