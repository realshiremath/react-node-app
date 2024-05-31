# Base image from 
FROM soleng.jfrog.io/alpha-docker-virtual/nginx:stable-alpine3.17-slim
FROM soleng.jfrog.io/alpha-docker-virtual/node:22

# Create app directory
WORKDIR /usr/src/app

# Copy dependency definitions
COPY package.json ./package.json
COPY package-lock.json ./package-lock.json

RUN npm install

# Get all the code needed to run the app
COPY --chown=node:node . .

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["npm", "start"]
