# Use Node base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install deps
COPY package.json yarn.lock ./
RUN yarn install

# Copy rest of the code
COPY . .

# Build Vite project
RUN yarn build

# Set environment port and run server
ENV PORT 8080
EXPOSE 8080
CMD ["node", "server.js"]
