FROM node:24-alpine

# Corrige vulnerabilidades das dependências internas do npm
RUN npm install -g npm@11.19.1

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --omit=dev

COPY src/ src/

RUN chown -R node:node /usr/src/app

USER node

EXPOSE 3000

CMD ["node", "src/server.js"]