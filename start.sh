#!/bin/bash
set -x

# todo if FUZZ is missing in URL add it by default
ffuf -w /opt/ffuf/words_and_files_small.txt -ac -u $1/FUZZ -H "X-Scanner: FFUF" -of csv -o /var/reports/ffuf_scan.csv -r -mc 200,301,401,403,405 ${@:2}

# remove header
sed -i 1d /var/reports/ffuf_scan.csv
# remove 2, 5 and 6th column
cut -d, -f2,5,6 /var/reports/ffuf_scan.csv >> /var/reports/sorted_ffuf_scan.csv
# unique sort on the lines
sort -u -o /var/reports/sorted_ffuf_scan.csv /var/reports/sorted_ffuf_scan.csv
# unique sort on the 3rd column (response size)
sort -k3 -nr -o /var/reports/sorted_ffuf_scan.csv /var/reports/sorted_ffuf_scan.csv

python3 /opt/ffuf/ffuf_qt.py