FROM n8nio/n8n:latest

# Cambiar a root para configurar permisos
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Volver a usuario node
USER node
WORKDIR /home/node

# Variables de entorno
ENV N8N_PORT=10000
ENV N8N_HOST=0.0.0.0
ENV NODE_ENV=production

EXPOSE 10000

# Usar la ruta completa al binario de n8n
CMD ["/usr/local/bin/node", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]
