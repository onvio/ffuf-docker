# ffuf-docker
Oneliner to run ffuf scan against target URL using a good wordlist

## Running
```
docker run -v $(pwd)/reports:/var/reports onvio/ffuf-docker https://example.org
```
  
Example targets:
* https://ffuf.io.fi
* https://example.org

## Building
```
git clone git@github.com:onvio/ffuf-docker.git
cd ffuf-docker
docker build -t ffuf-docker .
docker run -v $(pwd)/reports:/var/reports ffuf-docker https://example.org
```

## Outputs
Outputs will be saved in ./reports
  
| Report               | Description                                             |
|----------------------|---------------------------------------------------------|
| ffuf_scan.csv        | Full ffuf report in csv                                 |
| fuff.json            | JSON report for with Generic JSON warnings              |
