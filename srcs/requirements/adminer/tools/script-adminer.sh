#!/bin/bash
set -e

# Scarica l'ultima versione di Adminer e la posiziona nella directory web
wget -O /var/www/adminer/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# Avvia PHP-FPM in foreground
exec php-fpm8.2 -F