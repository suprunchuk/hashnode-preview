FROM node:20-alpine as builder
WORKDIR /app

COPY package*.json ./
RUN npm ci --production
COPY . .

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app .

ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "./src/server.js"]
