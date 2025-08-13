FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

RUN groupadd --gid 1000 node && \
    useradd --uid 1000 --gid node --shell /bin/bash --create-home node

RUN npm install -g n8n

USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node

ENV N8N_PORT=10000
ENV N8N_HOST=0.0.0.0
ENV NODE_ENV=production

EXPOSE 10000

# Cambiar "start" por solo "n8n" 
CMD ["n8n"]
