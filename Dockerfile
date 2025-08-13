FROM n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node

ENV N8N_PORT=10000
ENV N8N_HOST=0.0.0.0

EXPOSE 10000

# Usar npm para ejecutar n8n
CMD ["npm", "start"]
