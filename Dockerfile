# Base image with Node.js
FROM node:18

# Create app directory
WORKDIR /app

# Copy dependencies
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy everything else
COPY . .

# Build your Vite app
RUN yarn build

# Cloud Run requires PORT=8080
ENV PORT 8080

# Start Express server
CMD ["node", "server.js"]
