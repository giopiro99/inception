FROM debian:bookworm

RUN apt update && apt install -y redis-server

EXPOSE 6379

CMD ["redis-server",  "--bind", "0.0.0.0", "--protected-mode", "no"]