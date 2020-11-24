import csv
import json
import logging

data = {
    "vulnerabilities": []
}

report_path = "/var/reports/ffuf.json"

try:
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
except FileNotFoundError:
    logging.error('Ffuf scan report not found')