# Base image from 
FROM productdemo.jfrog.io/sharan-test-repo/nginx:stable-alpine3.17-slim
FROM productdemo.jfrog.io/sharan-test-repo/node:22

# Run as root 
# USER root
# Create app directory

RUN mkdir -p nodeapp
WORKDIR /nodeapp


COPY . /nodeapp

RUN npm install --unsafe-perm

# Get all the code needed to run the app
COPY --chown=node:node . .

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["npm", "start"]
