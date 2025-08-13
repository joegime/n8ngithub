FROM node:18-alpine

# Instalar n8n globalmente
RUN npm install -g n8n

# Crear usuario y directorio
RUN addgroup -g 1000 node && \
    adduser -u 1000 -G node -s /bin/sh -D node

USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node

ENV N8N_PORT=10000
ENV N8N_HOST=0.0.0.0
ENV NODE_ENV=production

EXPOSE 10000

CMD ["n8n", "start"]
