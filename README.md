# 🐳 Inception - System Administration & Docker

This project is part of the **42 School** curriculum. The objective is to broaden system administration knowledge using **Docker** to virtualize several services.

Instead of creating full virtual machines, the task is to set up a small infrastructure composed of several containerized services, managed via **Docker Compose**.

## 📑 Project Overview

The project requires setting up a specific infrastructure composed of three main containers communicating with each other within a dedicated Docker network.

* **Host OS:** Linux (VM)
* **Virtualization:** Docker & Docker Compose
* **Container OS:** Debian

### The Architecture

The infrastructure consists of the following services, each in a separate container:

1.  **NGINX:** Acts as the secure entry point (HTTPS), handling SSL/TLS certificates and redirecting traffic.
2.  **WordPress:** The CMS, configured to run with PHP-FPM.
3.  **MariaDB:** The relational database to store WordPress data.

> ⚠️ All containers are built from scratch using custom **Dockerfiles**. The use of ready-made images from DockerHub with predefined setups is prohibited.

---

## 🛠️ Tech Stack

* **Docker Engine:** For containerization.
* **Docker Compose:** For multi-container orchestration.
* **NGINX:** Web server and Reverse Proxy.
* **MariaDB:** SQL Database.
* **WordPress + PHP-FPM:** Content Management System.
* **OpenSSL:** For generating self-signed SSL certificates (TLSv1.2/1.3).
* **Make:** For automating build and run commands.

---

## ⚙️ Features & Rules

The infrastructure follows strict rules to ensure security and persistence:

* **Network Isolation:** Containers communicate only through an internal Docker network. Only port `443` (HTTPS) is exposed to the host.
* **Data Persistence:** Docker volumes are used to ensure that Database data and WordPress files are not lost in case of container restart.
* **Security:**
    * No passwords are hardcoded in the Dockerfiles; environment variables (`.env`) are used.
    * Access via HTTPS only.
* **Automation:** A `Makefile` manages the entire application lifecycle.

---

## 🚀 Installation & Usage

### Prerequisites
* Docker
* Docker Compose
* Make

### Instructions

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/inception.git](https://github.com/your-username/inception.git)
    cd inception
    ```

2.  **Environment Variables Configuration:**
    Create a `.env` file in the `srcs` directory (or root, depending on your structure). You can use the provided template or set the following variables:

    ```env
    DOMAIN_NAME=login.42.fr
    MYSQL_ROOT_PASSWORD=secret
    MYSQL_USER=user
    MYSQL_PASSWORD=password
    MYSQL_DATABASE=wordpress
    # ... other necessary variables
    ```

3.  **Start:**
    Use the Makefile to build the images and start the containers:
    ```bash
    make
    ```
    *This command will download dependencies, build images from scratch, and start services in the background.*

4.  **Access:**
    Open your browser and go to: `https://login.42.fr` (replace *login* with your 42 username if required by the subject).
    > *Note: Accept the browser security warning as the certificate is self-signed.*

---

## 🕹️ Useful Makefile Commands

| Command | Description |
| :--- | :--- |
| `make` | Builds and starts the infrastructure. |
| `make build` | Builds the Docker images only. |
| `make down` | Stops and removes containers. |
| `make clean` | Stops containers and removes images/networks. |
| `make fclean` | **Total Reset:** Removes containers, images, networks, and volumes (data lost). |

---

## 📂 Structure

```text
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   ├── .env                # Secret file (not pushed to git)
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
