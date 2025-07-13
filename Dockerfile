# Use official Node.js LTS image
FROM node:18

# Set working directory
WORKDIR /app

# Copy dependency files and install
COPY package.json yarn.lock ./
RUN yarn install

# Copy entire project
COPY . .

# Build static site using Vite
RUN yarn build

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Start Express server
CMD ["node", "server.js"]
