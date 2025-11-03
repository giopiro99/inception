NAME = inception

COMPOSE = docker compose -f srcs/docker-compose.yml

DATA_DIR = ~/data

WP_DIR = $(DATA_DIR)/wordpress

MARIA_DIR = $(DATA_DIR)/mariadb

HTML_DIR = $(DATA_DIR)/html

.ONESHELL:

all: down setup up

setup:
	sudo mkdir -p $(DATA_DIR)
	sudo mkdir -p $(WP_DIR)
	sudo mkdir -p $(MARIA_DIR)
	sudo mkdir -p $(HTML_DIR)
	sudo chmod 777 $(HTML_DIR)
	sudo cat > $(HTML_DIR)/index.html << 'EOF'
	<!DOCTYPE html>
	<html lang="it">
	<head>
		<meta charset="UTF-8">
		<title>Sito prova inception</title>
	</head>
	<body>
		<h1>Ciao, questo è un sito prova</h1>
		<p>Qua puoi mettere il tuo sito, nella cartella data/html</p>
	</body>
	</html>
	EOF

up:
	sudo $(COMPOSE) up -d --build

down:
	sudo $(COMPOSE) down

fclean: down
	sudo rm -rf $(DATA_DIR)
	sudo docker system prune -a

re: fclean all

