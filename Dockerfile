# Use official Node LTS image
FROM node:18

# Create and set working directory
WORKDIR /app

# Copy package manager files first (for better caching)
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy everything else
COPY . .

# Build Vite output into /dist
RUN yarn build

# Set environment port (used by Cloud Run)
ENV PORT=8080
EXPOSE 8080

# Start Express server
CMD ["node", "server.js"]
