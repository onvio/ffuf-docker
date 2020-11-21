from csv import reader
import json
import sys
import os

data = {
    "vulnerabilities": []
}

report_path = "/var/reports/ffuf.json"

with open('/var/reports/ffuf_scan.csv', 'r') as read_obj:
    csv_reader = reader(read_obj)
    list_of_rows = list(csv_reader)
    for i in list_of_rows:
        data['vulnerabilities'].append({
            'title': 'Directory / File Detected',
            'description': i[0],
            'severity': i[1]
        })

with open(report_path, 'w') as outfile:
    json.dump(data, outfile)