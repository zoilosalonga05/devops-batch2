FROM ubuntu:20.04
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html/
COPY source ./
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
