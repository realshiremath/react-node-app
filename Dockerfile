# Base image from 
FROM productdemo.jfrog.io/sharan-test-repo/nginx:stable-alpine3.17-slim
FROM productdemo.jfrog.io/sharan-test-repo/node:22

# Create app directory
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN npm install --unsafe-perm

# Get all the code needed to run the app
COPY --chown=node:node . .

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["npm", "start"]
