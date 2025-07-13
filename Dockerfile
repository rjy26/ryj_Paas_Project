# Use Node.js base image
FROM node:18

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

RUN yarn build

ENV PORT 8080
CMD ["node", "server.js"]
