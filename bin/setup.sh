#!/bin/bash
# must be run from the root directory (e.g., bin/setup.sh)

if [ -z $DELAY ]; then
  DELAY=0
fi

echo "======================"
echo "INFO: compiling 3PAR commit: (`git log --oneline -1`)"
cd src >> /dev/null
make
echo "compile compile compile..."; sleep $DELAY
echo "compile compile compile..."; sleep $DELAY
make install
cd - >> /dev/null
echo ""

echo "======================"
echo "INFO: setting up 3PAR"
echo "setup setup setup..."; sleep $DELAY
echo "setup setup setup..."; sleep $DELAY
bin/threepar
echo ""
