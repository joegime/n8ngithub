FROM n8nio/n8n:latest

USER root

# Configurar directorio
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node

# Variables de entorno críticas para Render
ENV N8N_PORT=10000
ENV N8N_HOST=0.0.0.0
ENV N8N_LISTEN_ADDRESS=0.0.0.0
ENV N8N_PROTOCOL=http
ENV NODE_ENV=production

EXPOSE 10000

# Usar el comando exacto que funciona en la imagen oficial
CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n"]
