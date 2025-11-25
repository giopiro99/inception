#!/bin/bash
set -e

wget -O /var/www/adminer/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

exec php-fpm8.2 -F