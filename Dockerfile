# Base image from 
FROM soleng.jfrog.io/alpha-docker-virtual/nginx:stable-alpine3.17-slim
FROM soleng.jfrog.io/alpha-docker-virtual/node:22

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Create app directory
WORKDIR /home/node/app

# Copy dependency definitions
COPY package*.json ./

USER node

RUN npm install

# Get all the code needed to run the app
COPY --chown=node:node . .

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["npm", "start"]
