#!/bin/bash
set -x

sed -i 1d /var/reports/ffuf_scan.csv
cut -d, -f2,5,6 /var/reports/ffuf_scan.csv >> /var/reports/sorted_ffuf_scan.csv
sort -u -o /var/reports/sorted_ffuf_scan.csv /var/reports/sorted_ffuf_scan.csv
sort -k3 -nr -o /var/reports/sorted_ffuf_scan.csv /var/reports/sorted_ffuf_scan.csv