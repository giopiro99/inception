#!/bin/bash

cd /var/www/index

# Verifica se il file wp-cli.phar non esiste
if [ ! -f wp-cli.phar ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    echo "wp-cli.phar downloaded"
fi

# Verifica se WordPress non è già stato scaricato
if [ ! -d "wp-content" ]; then
    ./wp-cli.phar core download --allow-root
    echo "WordPress downloaded"
fi

# Verifica se il file di configurazione di WordPress non esiste già
if [ ! -f "wp-config.php" ]; then
    ./wp-cli.phar config create \
    --dbname=${WORDPRESS_DB_NAME} \
    --dbuser=${WORDPRESS_DB_USER} \
    --dbpass=${WORDPRESS_DB_PASSWORD} \
    --dbhost=mariadb --allow-root
    echo "wp-config.php created"
fi

if ! ./wp-cli.phar core is-installed --allow-root; then
    echo "Installing WordPress for the first time..."
    ./wp-cli.phar core install \
        --url="gpirozzi.42.fr" \
        --title="inception" \
        --admin_user="${WORDPRESS_ADMIN_USER}" \
        --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
        --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
        --allow-root
    echo "WordPress installed successfully!"
else
    echo "WordPress is already installed, skipping installation."
fi


# Verifica se l'utente amministratore non esiste già
if [ ! ./wp-cli.phar user get ${WORDPRESS_ADMIN_USER} --allow-root &> /dev/null ]; then
    ./wp-cli.phar user create \
    ${WORDPRESS_ADMIN_USER} \
    ${WORDPRESS_ADMIN_EMAIL} \
    --user_pass=${WORDPRESS_ADMIN_PASSWORD} \
    --role=administrator --allow-root
    echo "Admin user created"
fi

if ! ./wp-cli.phar user get "${WORDPRESS_USER}" --allow-root > /dev/null 2>&1; then
    echo "Creating new WordPress user '${WORDPRESS_USER}'..."
    ./wp-cli.phar user create \
        "${WORDPRESS_USER}" "${WORDPRESS_USER_EMAIL}" \
        --user_pass="${WORDPRESS_USER_PASSWORD}" \
        --role=subscriber \
        --allow-root
    echo "User '${WORDPRESS_USER}' created successfully!"
else
    echo "User '${WORDPRESS_USER}' already exists, skipping creation."
fi

#setto le variabili per redis e installo il plugin redis
./wp-cli.phar config set WP_REDIS_HOST redis --allow-root
./wp-cli.phar config set WP_REDIS_PORT 6379 --raw --allow-root
./wp-cli.phar config set WP_CACHE true --raw --allow-root
./wp-cli.phar plugin install redis-cache --activate --allow-root
./wp-cli.phar redis enable --allow-root
echo "added Redis and Redis configuration"

# Installa e attiva il plugin Redis Object Cache
chmod -R 777 /var/www/index/wp-content/

# Avvia php-fpm solo se non è già in esecuzione (opzionale, ma utile per evitare conflitti)
php-fpm8.2 -F
