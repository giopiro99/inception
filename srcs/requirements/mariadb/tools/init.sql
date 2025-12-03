/* Crea il database dove WordPress salverà articoli, utenti, configurazioni, ecc.
Nome del database: wordpress
Questo sarà quello che poi indicherai nel file
di configurazione di WordPress (wp-config.php o nel comando wp-cli). */
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

DROP USER IF EXISTS '${MYSQL_USER}'@'%';
/* Crea un utente del database che WordPress userà per connettersi.
'wpuser' è il nome utente.
'%' indica che può collegarsi da qualsiasi host (non solo da localhost).
'password' è la password di quell’utente*/
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
/* Concede all’utente tutti i privilegi su tutti i database (*.*).
In un ambiente reale, daresti solo i privilegi necessari
sul database wordpress (es: GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%'),
ma per semplicità nel progetto Inception si dà accesso completo. 
WITH GRANT OPTION permette all’utente di concedere
i propri privilegi ad altri utenti (utile ma non sempre consigliato).*/
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;
/* Ricarica la tabella dei privilegi per
rendere effettive le modifiche subito, senza riavviare MariaDB. */
FLUSH PRIVILEGES;
