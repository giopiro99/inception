Panoramica del ProgettoIl progetto richiede di configurare un'infrastruttura specifica composta da tre container principali che comunicano tra loro all'interno di una rete Docker dedicata.
Host OS: Linux (VM)Virtualizzazione: Docker & Docker ComposeContainer Debian.
L'Architettura L'infrastruttura è composta dai seguenti servizi, ognuno in un container separato: NGINX: Agisce come entry point sicuro (HTTPS), gestendo i certificati SSL/TLS e reindirizzando il traffico.
WordPress: Il CMS, configurato per girare con PHP-FPM.MariaDB: Il database relazionale per memorizzare i dati di WordPress.Tutti i container sono costruiti da zero utilizzando Dockerfiles personalizzati (l'uso di immagini pronte da DockerHub con setup predefiniti è vietato).
Stack Tecnologico Docker Engine: Per la containerizzazione.Docker Compose: Per l'orchestrazione dei multi-container.
NGINX: Web server e Reverse Proxy.MariaDB: Database SQL.WordPress + PHP-FPM: Content Management System.OpenSSL: Per la generazione di certificati SSL autofirmati (TLSv1.2/1.3).
Make: Per l'automazione dei comandi di build e run.⚙️ Caratteristiche e RegoleL'infrastruttura segue regole rigorose per garantire sicurezza e persistenza:Network Isolation: I container comunicano solo attraverso una rete Docker interna.
Solo la porta 443 (HTTPS) è esposta all'host.Data Persistence: I volumi Docker sono utilizzati per garantire che i dati del Database e i file di WordPress non vadano persi in caso di riavvio dei container.Security:Nessuna password è hardcodata nei Dockerfile;
vengono utilizzate variabili d'ambiente (.env).Accesso solo via HTTPS.Automazione: Un Makefile gestisce l'intero ciclo di vita dell'applicazione.
Installazione e UtilizzoPrerequisitiDockerDocker ComposeMakeIstruzioniClona il repository: Bash git clone https://github.com/tuo-username/inception.git
cd inception
Configurazione Variabili d'Ambiente:Crea un file .env nella directory srcs (o root, a seconda della tua struttura). Puoi usare il template fornito (se presente) o impostare le seguenti variabili:Snippet di codiceDOMAIN_NAME=login.42.fr
MYSQL_ROOT_PASSWORD=secret
MYSQL_USER=user
MYSQL_PASSWORD=password
MYSQL_DATABASE=wordpress
# ... altre variabili necessarie
Questo comando scaricherà le dipendenze, costruirà le immagini da zero e avvierà i servizi in background.Accesso:Apri il browser e vai su: https://login.42.fr (sostituisci login con il tuo username 42 se richiesto dal subject).
Nota: Accetta l'avviso di sicurezza del browser poiché il certificato è autofirmato.Comandi Makefile UtiliComandoDescrizionemakeCostruisce e avvia l'infrastruttura.
make build Esegue solo la build delle immagini Docker.
make downFerma e rimuove i container.make cleanFerma i container e rimuove immagini/network.make fcleanReset Totale: Rimuove container, immagini, network e volumi (dati persi).
Struttura:
```text
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   ├── .env                # File segreto (non pushato su git)
│   ├── requirements/
│   │   ├── mariadb/
│   │   │   ├── Dockerfile
│   │   │   ├── conf/
│   │   │   └── tools/
│   │   ├── nginx/
│   │   │   ├── Dockerfile
│   │   │   └── conf/
│   │   └── wordpress/
│   │       ├── Dockerfile
│   │       ├── conf/
│   │       └── tools/
```
Cosa ho imparato Docker Deep Dive: Come scrivere Dockerfile efficienti, minimizzare i layer e gestire il PID 1.
Service Orchestration: Gestione delle dipendenze tra servizi (es. WordPress deve aspettare che MariaDB sia pronto).
System Administration: Configurazione manuale di NGINX e PHP-FPM, gestione dei permessi utente e dei processi.
Network & Volumi: Comprensione profonda di come Docker gestisce il networking interno e il mount dei volumi sull'host.Created by gpirozzi - 42 Student
