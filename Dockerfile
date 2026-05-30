FROM node:18-alpine AS client-builder
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

FROM node:18-alpine
WORKDIR /app

COPY server/package*.json ./server/
WORKDIR /app/server
RUN npm install --production

WORKDIR /app
COPY --from=client-builder /app/client/dist ./client/dist
COPY server/ ./server/

WORKDIR /app/server

EXPOSE 5000

CMD ["node", "server.js"]
