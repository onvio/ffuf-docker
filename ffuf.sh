#!/bin/bash
set -x
args="$@"

ffuf -w words_and_files_small.txt -u $1/FUZZ -H "X-Scanner: ZAP" -of csv -o /var/reports/ffuf_scan.csv -r -mc 200,301,401,403,405 $2
