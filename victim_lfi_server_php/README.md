# PHP 

Start in this directory (be sure the port 8893 is not used, otherwise change it):

```
docker build -t php-lfi-app . && docker run -d -p 127.0.0.1:8893:80 -v "$(pwd)"/src:/var/www/html/ php_lfi_app
docker exec -ti <id> /bin/bash
```

# Problematic code

```
<?php
$secret_file = $_GET['secret_file'];
include ( $secret_file);
?>
```
