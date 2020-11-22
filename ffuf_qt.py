import csv
import json
import sys

data = {
    "vulnerabilities": []
}

report_path = "/var/reports/ffuf.json"

with open('/var/reports/ffuf_scan.csv', 'r') as csvfile:
    report_reader = csv.reader(csvfile)
    # Skip the header
    next(report_reader)
    for row in report_reader:
        data['vulnerabilities'].append({
            'title': 'Directory / File Detected',
            'description': row[1], # Full URL with fuzzed path
            'severity': "medium"
        })

with open(report_path, 'w') as outfile:
    json.dump(data, outfile)