# ffuf-docker
Oneliner to run ffuf scan against target URL using a good wordlist
  
```
git@github.com:onvio/ffuf-docker.git
cd ffuf-docker
docker build -t ffuf-docker .
docker run -v $(pwd)/reports:/var/reports ffuf-docker https://example.org
```
  
Example targets:
* https://ffuf.io.fi
* https://example.org
  
## **Outputs**
Outputs will be saved in ./reports
  
| Report type          | Description                                             |
|----------------------|---------------------------------------------------------|
| ffuf_scan.csv        | Full ffuf report in csv                                 |
| sorted_ffuf_scan.csv | Minimal report: unique sort on url and on response size |
| ffuf_scan_qt.json    | JSON report for Quality Time Generic JSON warnings      |
  
  
  
## **To-do**
*   Handle optional ffuf arguments