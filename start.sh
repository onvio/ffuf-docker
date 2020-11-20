#!/bin/bash
set -x
args="$@"

## Remove protocol part of url for IO operations##
f=$1
f="${f#http://}"
f="${f#https://}"
f=${f%%/*}

bash /opt/ffuf/ffuf.sh $1 "$2"
/opt/ffuf/sort_ffuf.sh
sleep 2
python3 /opt/ffuf/ffuf_qt.py