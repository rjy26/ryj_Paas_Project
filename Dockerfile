# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install deps
COPY package.json yarn.lock ./
RUN yarn install

# Copy the rest of the code
COPY . .

# Build the Vite app
RUN yarn build

# Expose the port Cloud Run uses
ENV PORT 8080

# Start the Express server
CMD [ "node", "server.js" ]
