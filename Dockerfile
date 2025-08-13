FROM ubuntu:20.04

# Evitar prompts durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Instalar Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Crear usuario node
RUN groupadd --gid 1000 node && \
    useradd --uid 1000 --gid node --shell /bin/bash --create-home node

# Instalar n8n globalmente
RUN npm install -g n8n

# Configurar directorio de trabajo
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node

# Variables de entorno
ENV N8N_PORT=10000
ENV N8N_HOST=0.0.0.0
ENV NODE_ENV=production

EXPOSE 10000

CMD ["n8n", "start"]
