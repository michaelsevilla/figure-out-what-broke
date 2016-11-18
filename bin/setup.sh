#!/bin/bash
# must be run from the root directory (e.g., bin/setup.sh)

echo "======================"
echo "INFO: compiling 3PAR"
cd src >> /dev/null
make
echo "compile compile compile..."; sleep $1
echo "compile compile compile..."; sleep $1
make install
cd - >> /dev/null
echo ""

echo "======================"
echo "INFO: setting up 3PAR"
echo "setup setup setup..."; sleep $1
echo "setup setup setup..."; sleep $1
bin/threepar
echo ""
