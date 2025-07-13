# Step 1: Build
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Step 2: Serve
FROM node:18
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY server.js .
RUN npm install express
EXPOSE 8080
CMD ["node", "server.js"]
