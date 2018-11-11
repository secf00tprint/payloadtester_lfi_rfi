# PHP 

```
 72  docker rmi -f my-php-app
   73  cd ..
   74  history
   75  docker build -t my-php-app . && docker run -d -p 127.0.0.1:4353:80 --name my-running-app my-php-app
   76  docker exec -ti 26e8d91277e03b88fed8570ae7da3e9742fb04993e2fdc2efd89d73821abd933 /bin/bash
```

[https://en.wikipedia.org/wiki/File_inclusion_vulnerability](https://en.wikipedia.org/wiki/File_inclusion_vulnerability)

# Simple
<?php
$secret_file = $_GET['secret_file'];
include ( $secret_file);
?>
