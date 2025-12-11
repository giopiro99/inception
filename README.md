# 🐳 Inception - System Administration & Docker

**Inception** is a System Administration project from the **42 School** curriculum.

The goal is to create a small infrastructure composed of several containerized services, managed via **Docker Compose**, building a deep understanding of Docker orchestration.

## 📑 Project Overview

The infrastructure creates a network of containers that communicate internally, following specific security and isolation rules.

Instead of using ready-made Docker images, each service is built from a custom **Dockerfile** based on **Debian**.

### 🏗️ Architecture & Services

The project is divided into the **Mandatory** stack and the **Bonus** additions, all running on a virtualized Linux Host.

#### Mandatory Services
1.  **NGINX (Entry Point):** The only container with exposed ports (443). It handles TLSv1.3 HTTPS connections and acts as a reverse proxy.
2.  **WordPress + PHP-FPM:** The CMS, installed and configured via CLI commands.
3.  **MariaDB:** The database backend for WordPress.

#### 🌟 Bonus Services
4.  **Redis:** Configured as a cache for WordPress to improve performance.
5.  **Adminer:** A lightweight database management interface (access via web).
6.  **FTP Server (vsftpd):** Allows file transfer to the WordPress volume.
7.  **Portainer:** A web UI to manage the Docker environment.
8.  **Static Website:** A simple custom website served effectively.

---

## ⚙️ Network & Security

* **Isolation:** Containers communicate over a private Docker network.
* **Encrypted Traffic:** Access is strictly via **HTTPS** (port 443). HTTP requests are blocked or redirected.
* **TLS Certificates:** Self-signed certificates are generated dynamically via OpenSSL.
* **Volumes:** Data persistence is guaranteed for the Database and Web files using Docker Volumes mounted on the host machine.

---

## 🚀 Installation & Usage

### Prerequisites
* Linux VM (standard 42 setup)
* Docker & Docker Compose
* Make

### 1. Setup Environment
Clone the repository and navigate to the folder:
```bash
git clone [https://github.com/giopiro99/inception.git](https://github.com/giopiro99/inception.git)
cd inception
```

```text
Command,Description
make,Builds images and starts the whole infrastructure.
make build,Rebuilds the Docker images without starting.
make stop,Pauses the containers.
make down,Stops and removes containers and networks.
make clean,"Removes containers, networks, and images."
make fclean,Deep Clean: Removes everything including Volumes (Data is lost).
make re,Performs a full rebuild (fclean + all).
```

```text
📂 Project Structure
inception/
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   ├── .env                # Environment variables
│   └── requirements/
│       ├── nginx/          # NGINX setup & SSL
│       ├── mariadb/        # Database setup
│       ├── wordpress/      # WP & PHP-FPM
│       ├── redis/          # Cache (Bonus)
│       ├── ftp/            # FTP Server (Bonus)
│       ├── adminer/        # DB GUI (Bonus)
│       └── portainer/      # Docker GUI (Bonus)
└── secrets/                # SSL Keys storage
