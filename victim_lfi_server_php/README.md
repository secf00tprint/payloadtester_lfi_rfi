# PHP 

```
docker build -t my-php-app . && docker run -d -p 127.0.0.1:4353:80 php_lfi_app
docker exec -ti <id> /bin/bash
```

# Problematic code

<?php
$secret_file = $_GET['secret_file'];
include ( $secret_file);
?>
